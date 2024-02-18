#!/bin/bash

echo "Benvingut al joc de pedra, paper o tisores!"

# Bucle until per continuar jugant
until [ "$continuar" = "no" ]; do
    # Opcions del joc
    opcions=("pedra" "paper" "tisores")

    # Generem la selecció de la màquina
    seleccio_maquina=${opcions[$((RANDOM % 3))]}

    # Demanem la selecció de l'usuari
    read -p "Tria pedra, paper o tisores: " seleccio_usuari

    # Validem l'entrada de l'usuari
    if [[ ! " ${opcions[@]} " =~ " ${seleccio_usuari} " ]]; then
        echo "Selecció no vàlida. Si us plau, tria entre pedra, paper o tisores."
        continue
    fi

    # Mostrem les seleccions
    echo "Tu has triat: $seleccio_usuari"
    echo "La màquina ha triat: $seleccio_maquina"

    # Determinem el guanyador
    if [ "$seleccio_usuari" = "$seleccio_maquina" ]; then
        echo "Empat!"
    elif [ "$seleccio_usuari" = "pedra" ] && [ "$seleccio_maquina" = "tisores" ] || \
         [ "$seleccio_usuari" = "paper" ] && [ "$seleccio_maquina" = "pedra" ] || \
         [ "$seleccio_usuari" = "tisores" ] && [ "$seleccio_maquina" = "paper" ]; then
        echo "Felicidades! Has guanyat!"
    else
        echo "La màquina guanya!"
    fi

    # Preguntem si vol continuar jugant
    read -p "Vols jugar de nou? (si/no): " continuar
done

echo "Gràcies per jugar!"
