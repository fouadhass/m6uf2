#!/bin/bash

#Nom programa
echo "Nom script: $0"

echo "Arguments \$@:"
for ar1 in "$@"; do
    echo "$ar1"
done

echo "Mostrar los argumentos con \$*:"
for ar2 in $*; do
    echo "$ar2"
done

total_arg="$#"
echo "Nombre total d'arguments : $total_arg"

echo "\$* Unica cadena per espais"
