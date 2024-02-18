#!/bin/bash

# Comprovar si s'ha passat un nom d'usuari com a paràmetre
if [ $# -eq 0 ]; then
    echo "Error: S'ha d'introduir un nom d'usuari com a paràmetre."
    exit 1
fi

# Emmagatzemar el nom d'usuari passat com a paràmetre
nom_usuari=$1

# Opcions disponibles per l'usuari
echo "Opcions disponibles:"
echo "1. Comprovar si té drets d'administrador."
echo "2. Comprovar si l'usuari existeix."
echo "3. Comprovar si la ruta del directori personal és vàlida."

# Demanar a l'usuari que triï una opció
read -p "Introdueix el número de l'opció que desitges: " opcio

# Realitzar accions basades en l'opció seleccionada
case $opcio in
    1)
        if sudo -lU $nom_usuari &> /dev/null; then
            echo "L'usuari té drets d'administrador."
        else
            echo "L'usuari no té drets d'administrador."
        fi
        ;;
    2)
        if id $nom_usuari &> /dev/null; then
            echo "L'usuari existeix."
        else
            echo "L'usuari no existeix."
        fi
        ;;
    3)
        directori_personal=$(getent passwd $nom_usuari | cut -d: -f6)
        if [ -d "$directori_personal" ]; then
            echo "La ruta del directori personal és vàlida."
        else
            echo "La ruta del directori personal no és vàlida o no existeix."
        fi
        ;;
    *)
        echo "Opció no vàlida."
        ;;
esac
