#!/bin/bash

# Llegim el nom de l'arxiu
read -p "Escriu el nom de l'arxiu que vols eliminar comentaris: " arxiu

# Eliminem els comentaris de l'arxiu
sed '/^#/d' "$arxiu" > no_comentaris.txt

# Mostrem el contingut de l'arxiu sense comentaris
echo "Contingut de l'arxiu sense comentaris:"
cat no_comentaris.txt

# Llegim la paraula que l'usuari vol buscar
read -p "Escriu la paraula que vols buscar: " paraula

# Inicialitzem una variable per a comprovar si la paraula existeix
trobat=0

# Busquem la paraula a l'arxiu sense comentaris
while read -r linia; do
    for para in $linia; do
        if [[ "$paraula" == "$para" ]]; then
            trobat=1
            break
        fi
    done
done < no_comentaris.txt

# Mostrem el resultat de la cerca
if [ "$trobat" -eq 1 ]; then
    echo "La paraula existeix a l'arxiu."
else
    echo "La paraula NO existeix a l'arxiu."
fi

# Llegim la frase que l'usuari vol afegir
read -p "Escriu la frase que vols afegir a l'arxiu: " nova_frase

# Afegim la nova frase al final de l'arxiu sense comentaris
echo "$nova_frase" >> no_comentaris.txt

# Mostrem el contingut actualitzat de l'arxiu
echo "Arxiu amb la nova frase afegida:"
cat no_comentaris.txt

