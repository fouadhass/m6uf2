#!/bin/bash

read -p "Escriu la ruta del fitxer o directori: " dirfit

# Al primer if comprova que aquesta ruta existeix al nostre arrel Linux, després validem si es un directori.
# En cas de que sigui un direcori printa per terminal que es un direcori, en cas contrari 
# indiquem que es un fitxer junt a la seva extensió
if [ -e $dirfit ]
then
	if [ -d $dirfit ]
	then
 
	echo "És un directori."
 
	else
 
	echo "És un arxiu i la extensió es: "${dirfit##*.}
 
	fi
fi
