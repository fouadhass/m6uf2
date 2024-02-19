#!/bin/bash
# Script per comprovar l'estat dels servidors remots i registrar els resultats

# Funció per comprovar l'estat d'un servidor remot
comprovar_estat_servidor() {
    servidor=$1
    estat=$(ping -c 1 $servidor &> /dev/null && echo "ACTIU" || echo "INACTIU")
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $servidor: $estat" >> registre.txt
}

# Funció per comprovar l'estat de tots els servidors
comprovar_tots_servidors() {
    echo "Comprovant l'estat dels servidors..."
    while read -r servidor; do
        comprovar_estat_servidor $servidor
    done < servidors.txt
}

# Inici del script
echo "Inici de comprovació dels servidors."
comprovar_tots_servidors
echo "Comprovació finalitzada. Els resultats s'han registrat a registre.txt."
