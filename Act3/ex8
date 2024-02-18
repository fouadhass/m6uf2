#!/bin/bash

# Bucle until para comprobar la conexión a Internet
until ping -c 1 8.8.8.8 &> /dev/null; do
    echo "No hi ha connexió a Internet. Esperant 5 segons..."
    sleep 5
done

echo "Connexió a Internet establerta. Obrint la pàgina de l'Institut Sabadell..."

# Obrir la pàgina de l'Institut en el navegador preferit
firefox https://agora.xtec.cat/ies-sabadell/
