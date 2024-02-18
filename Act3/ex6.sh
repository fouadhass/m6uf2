#!/bin/bash

# Inicialitzem la variable per emmagatzemar la ruta del directori
ruta=""

# Bucle until per demanar la ruta del directori fins que sigui vàlida
until [ -d "$ruta" ]; do
    read -p "Introdueix la ruta del directori: " ruta
    if [ ! -d "$ruta" ]; then
        echo "La ruta especificada no és un directori vàlid."
    fi
done

# Mostrem els permisos del directori
echo "Els permisos del directori són:"
ls -ld "$ruta" | cut -d " " -f 1

# Comptem la quantitat d'arxius i carpetes dins del directori
num_arxius=$(find "$ruta" -maxdepth 1 -type f | wc -l)
num_carpetes=$(find "$ruta" -maxdepth 1 -type d | wc -l)

echo "Quantitat d'arxius: $num_arxius"
echo "Quantitat de carpetes: $num_carpetes"

# Mostrem els noms dels arxius dins del directori
echo "Els noms dels arxius dins del directori són:"
find "$ruta" -maxdepth 1 -type f -exec basename {} \;

# Mostrem els noms de les carpetes dins del directori
echo "Els noms de les carpetes dins del directori són:"
find "$ruta" -maxdepth 1 -type d -exec basename {} \;
