#!/bin/bash

# Comprovem si ja existeix l'arxiu de paraules
if [ -f "paraules.txt" ]; then
    echo "L'arxiu de paraules ja existeix."
else
    touch "paraules.txt"
    echo "S'ha creat l'arxiu de paraules."
fi

echo "Benvingut al programa de emmagatzematge de paraules!"
echo "Introdueix les paraules que vols emmagatzemar. Per acabar, escriu ':>'"

# Bucle infinit per llegir les paraules de l'usuari
while true; do
    read -p "Introdueix una paraula: " paraula
    
    # Comprovem si l'usuari ha introduït el marcador per acabar
    if [ "$paraula" = ":>" ]; then
        echo "Has finalitzat l'entrada de paraules."
        break  # Sortim del bucle
    fi
    
    # Escrivim la paraula a l'arxiu
    echo "$paraula" >> "paraules.txt"
done

echo "Les paraules han estat emmagatzemades correctament."
