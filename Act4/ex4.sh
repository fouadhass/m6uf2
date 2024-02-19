#!/bin/bash
# Inicia un script de bash

USG_ERR=7
# Define una variable anomenada USG_ERR i li assigna el valor 7

# Define una funció anomenada max_dos
max_dos ( ) {

	# Comprova si el primer argument és igual al segon
	if [ "$1" -eq "$2" ] ; then

 		# Imprimeix "Iguals" si són iguals
		echo 'Iguals'

    # Surt del script amb el codi de retorn 0
		exit 0
		
	# Si el primer argument és major que el segon
   elif [ "$1" -gt "$2" ] ; then
	
   # Assigna el primer argument a aquesta variable
		ret_val=$1

  # En cas contrari (si el segon argument és major que el primer)
	else
  
    # Assigna el segon argument a la variable ret_val
		ret_val=$2

  # Fi de la funció max_dos
	fi
}

