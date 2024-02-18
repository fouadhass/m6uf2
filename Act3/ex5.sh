#!/bin/bash

# Bucle until, se ececuta fins que al paràmetre sigui igual a 3
until [ "$#" -eq 3 ]; do

    echo "Error: Nombre de paràmetres ha de ser igual a 3"
    # Salir del script con un código de error
    exit 1
    
done

echo "Nombre de paràmetres correctes"
