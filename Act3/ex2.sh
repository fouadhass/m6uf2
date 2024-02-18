#!/bin/bash

read -p "Indica nombres enters: " nums

declare -i pos=0

# Un bucle de tipus for sobre els nombres introduits
for i in $nums
 do
 # Realitzem la búsqueda de qualsevol 0 en cada nombre, sens importar la posició
  if [[ $i == *"0"* ]]
   then
   (( pos++ ))
  fi
done

echo "Hem trobat $pos nombres enters que contenen zeros"
