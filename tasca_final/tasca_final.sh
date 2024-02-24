#!/bin/bash

# Demanar a l'usuari que introdueixi les variables REMOTE_USER i REMOTE_HOST
echo "Introdueixi l'usuari remot:"
read REMOTE_USER

echo "Introdueixi l'adreça IP del servidor remot:"
read REMOTE_HOST

# Funció per instal·lar NMAP si no està disponible
instalar_nmap() {
    echo "NMAP no està instal·lat al servidor remot. Instal·lant NMAP..."
    ssh $REMOTE_USER@$REMOTE_HOST 'sudo apt update && sudo apt install -y nmap'
}

# Funció per realitzar comprovacions en el servidor remot
realitzar_comprovacions() {
    echo "Iniciant comprovacions en el servidor remot..."

    # Comprovar si NMAP està instal·lat
    ssh $REMOTE_USER@$REMOTE_HOST 'command -v nmap' >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        instalar_nmap
    fi

    # Comprovació de l'estat dels serveis
    echo "Comprovant l'estat dels serveis:"
    serveis1=$(ssh $REMOTE_USER@$REMOTE_HOST 'systemctl status apache2')
    serveis2=$(ssh $REMOTE_USER@$REMOTE_HOST 'systemctl status nginx')
    serveis3=$(ssh $REMOTE_USER@$REMOTE_HOST 'systemctl status cron')
    serveis4=$(ssh $REMOTE_USER@$REMOTE_HOST 'systemctl status dbus')

    # Comprovació dels ports oberts
    echo "Comprovant els ports oberts:"
    ports=$(ssh $REMOTE_USER@$REMOTE_HOST 'nmap -A -v' $REMOTE_HOST '| grep "open"')

    # Comprovació de l'ús de la CPU
    echo "Comprovant l'ús de la CPU:"
    cpu=$(ssh $REMOTE_USER@$REMOTE_HOST 'top -b -n 1 | grep "Cpu(s)"')

    # Comprovació de l'ús de la memòria
    echo "Comprovant l'ús de la memòria:"
    memoria=$(ssh $REMOTE_USER@$REMOTE_HOST 'free -h')

    # Comprovació de l'espai en disc
    echo "Comprovant l'espai en disc:"
    disc=$(ssh $REMOTE_USER@$REMOTE_HOST 'df -h')

    # Comprovació de la versió del sistema operatiu
    echo "Comprovant la versió del sistema operatiu:"
    sistema_operatiu=$(ssh $REMOTE_USER@$REMOTE_HOST 'uname -a')

    # Aquesta línia configura una tasca programada que executarà l'script tasca_final.sh cada dia a les 23:55
    echo "55 23 * * * ./tasca_final.sh" | crontab -

    # Generar el contingut HTML amb here-docs
    html_content=$(cat << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Resultats de les comprovacions del servidor</title>
</head>
<body>
    <h1>Resultats de les comprovacions del servidor</h1>
 
    <h2>Estat dels serveis:</h2>
    <p>$serveis1<br/>$serveis2<br/>$serveis3<br/>$serveis4</p>

    <h2>Ports oberts:</h2>
    <p>$ports</p>

    <h2>Ús de la CPU:</h2>
    <p>$cpu</p>

    <h2>Ús de la memòria:</h2>
    <p>$memoria</p>

    <h2>Espai en disc:</h2>
    <p>$disc</p>

    <h2>Versió del sistema operatiu:</h2>
    <p>$sistema_operatiu</p>
</body>
</html>
EOF
)
    # Imprimir el contingut HTML
    echo "$html_content" > resultats.html

    # Obrir la pàgina resultats_comprovacions.html
    xdg-open resultats.html
}

# Funció per netejar recursos abans de sortir
netejar_recursos() {
    echo "Netejant recursos..."
    # Eliminar fitxe temporal si existeix
    if [ -f resultats.html ]; then
        echo "Eliminant l'arxiu temporal..."
        rm resultats.html
    fi

    echo "Recursos netejats amb èxit."
}

# Trap per capturar senyals i netejar recursos abans de sortir
trap 'netejar_recursos; echo "Sortint del script"; exit 1' SIGINT

# Funció principal per executar les comprovacions
main() {
    # Utilitzant here-doc per configurar l'autenticació basada en claus SSH
    ssh-keygen -t rsa -N "" <<< $'y\n'
    ssh-copy-id $REMOTE_USER@$REMOTE_HOST

    # Executar les comprovacions una vegada configurada l'autenticació
    realitzar_comprovacions
}

# Execució de la funció principal
main
