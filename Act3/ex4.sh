#!/bin/bash

# Obtenir els noms d'usuaris del sistema amb lletres majúscules
# Recordem als primers 1000 UID són reservats per al sistema
usuaris=$(awk -F':' '($3 >= 1000) {print $1}' /etc/passwd | grep [[:upper:]])

# Mostrar els noms d'usuaris amb lletres majúscules
echo "Noms d'usuaris del sistema amb lletres majúscules:"
echo "$usuaris"

# Demanar a l'usuari que introdueixi un nom d'usuari
while true; do
    read -p "Introdueix un nom d'usuari: " nom_usuari
    
    # Comprovar si el nom d'usuari introduït és vàlid
    if grep -q "^$nom_usuari:" /etc/passwd; then
        echo "Informació sobre l'usuari $nom_usuari:"
        grep "^$nom_usuari:" /etc/passwd
        break
    else
        echo "Error: Aquest nom d'usuari no és vàlid. Torna a intentar-ho."
    fi
done
