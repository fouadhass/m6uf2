#!/bin/bash

# Solicitem una entrada per recollir al nom de l'usuari
read -p "Usuari: " usuari

# Solicitem una entrada per recollir la contraseña oculta
read -s -p "Nova contraseña: " contra

# Mostrem nom usuari i ocultem la seva contraseña amb un hash
echo -e "\nNom usuari: $usuari\nContraseña: $contra | base64"

