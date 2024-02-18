#!/bin/bash

# Bucle until per continuar preguntant a l'usuari
until [ "$seguir" = "si" ] || [ "$seguir" = "no" ]; do
    echo "Estàs segur que vols continuar avançant en l'espiral d'emocions, alegries i èxits? (si/no)"
    read seguir
done

# Casos segons la resposta de l'usuari
case $seguir in
    si)
        echo "Endavant amb les emocions positives! Obrint l'enllaç adjunt..."
        xdg-open "https://www.youtube.com/watch?v=jaLDoWqIq2M"  # Obre amb el navegador per defecte ;)
        ;;
    no)
        echo "Entès. Gràcies per la teva resposta."
        ;;
esac
