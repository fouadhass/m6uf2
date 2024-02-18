#!/bin/bash

read -p "Indica al protocol: " protocol

# La opció wc permet comptar el nombre de vegades que es troba el protocol al fitxer wireshark_protocol.txt
# Amb la comanda grep ens permet fer una búsqueda de un contingut dins un fitxer
grep $protocol wireshark_protocol.txt > protocol.txt

wc -l protocol.txt
