#!/bin/bash

# Definir variables de conexión SSH
remote_user="fouad"
remote_host="192.168.1.41"
remote_password="super3"

# Ejecutar comando remoto usando HereDoc y SSH con sshpass
sshpass -p "$remote_password" ssh "$remote_user@$remote_host" << EOF
uptime
EOF
