#!/bin/bash

# ¡¡ PREVIAMENT IMPORTANT - HAS DE CREAR AQUEST DOS FITXERS!!
# servidors.txt que conté la llista dels teus servidors, un per línia (Exemple he posat la meva própia máquina).
# registre.txt que serà utilitzat per enregistrar els resultats de la comprovació (Un cop executat al script BASH, consulta al fitxer).

# Funció per comprovar l'estat d'un servidor remot
comprovar_estat_servidor() {
    # Assigna el primer argument de la funció (el nom del servidor) a la variable "servidor"
    servidor=$1
    # Utilitza la comanda ping per comprovar si el servidor és accessible
    # Si ping té èxit, l'estat és "ACTIU", si no, l'estat és "INACTIU"
    estat=$(ping -c 1 $servidor &> /dev/null && echo "ACTIU" || echo "INACTIU")
    # Imprimeix la data, l'hora, el nom del servidor i l'estat en un fitxer de registre
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $servidor: $estat" >> registre.txt
}

# Funció per comprovar l'estat de tots els servidors
comprovar_tots_servidors() {
    # Imprimeix un missatge indicant que comença la comprovació dels servidors
    echo "Comprovant l'estat dels servidors..."
    # Itera sobre cada línia del fitxer "servidors.txt"
    while read -r servidor; do
        # Crida a la funció "comprovar_estat_servidor" amb el nom del servidor com a argument
        comprovar_estat_servidor $servidor
    # Finalitza el bucle quan s'han llegit totes les línies del fitxer
    done < servidors.txt
}

# Inicia el script
echo "Inici de comprovació dels servidors."
# Crida a la funció "comprovar_tots_servidors" per iniciar la comprovació dels servidors
comprovar_tots_servidors
# Imprimeix un missatge indicant que la comprovació ha acabat i que els resultats s'han registrat
echo "Comprovació finalitzada. Els resultats s'han registrat a registre.txt."
