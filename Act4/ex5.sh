# Crida a la funció err_str
err_str ( ) {

  # Imprimeix un missatge amb el nom i als paràmetres 
	echo "Ús: $0 <numero1>  <numero2>"
	
	# Surt del script amb el codi d'error guardat a la variable USG_ERR
   exit $USG_ERR
	
}

# Assigna el primer argument de la línia de comandes a la variable NUM_1
NUM_1=$1

# Assigna el segon argument de la línia de comandes a la variable NUM_2
NUM_2=$2

# Comprova si el nombre d'arguments no és igual a 2
if [ $# -ne 2 ] ; then

	# Executa la funció err_str si la condició anterior es compleix
   err_str

# Si el primer argument és un nombre vàlid
elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ] ; then

  # Si el segon argument és un nombre vàlid
	if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ] ; then  
    
    # Executa la funció max_dos amb els dos números com a arguments
		max_dos $NUM_1 $NUM_2
  
    # Imprimeix el valor retornat per max_dos
		echo $ret_val

# Si el segon argument no és un nombre vàlid
	else

   # Executa la funció err_str
		err_str
  
  # Finalitza al segon if
	fi

# Si el primer argument no és un nombre vàlid
else
  
  # Executa la funció err_str
	err_str

#Finalitza el primer if
fi


# Finalitza el script amb un codi de sortida 0
exit 0
