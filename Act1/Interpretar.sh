                                                                                                     #!/bin/bash

CRACK=oriolorioloriol
echo CRCKMAQUINAFIERAJEFE=$CRACK

# Borra tot des de l'inici fins la última on trobi "ori" al final
echo 'El resultat de ##*ori és' ${CRACK##*ori}

# Elimina todo desde el inicio hasta la primera instancia de "ori" al principi
echo 'El resultat of #*ori és' ${CRACK#*ori}

# Elimina todo desde la última instancia de "ori" fins al final
echo 'El resultat of %%ori* és' ${CRACK%%ori*}

# Elimina todo desde la última instancia de "ori" fins al final
echo 'El resultat of %ori* és' ${CRACK%ori*}


# Pregunta:
# En què ens pot beneficiar l’ús dels paràmetres d’expansió? Quin ús els hi puc donar a l’hora de programar Bash scripts?

# Operacions de cadena: habiliteu operacions útils en cadenes de text, com eliminar prefixos o sufixos, cercar i reemplaçar patrons o eliminar subcadenes.
# Simplicitat del codi: minimitzeu la quantitat de codi necessària per realitzar operacions de cadenes comunes, per a una millor documentació i llegibilitat.
# Optimització de codi: proporciona excel·lents eines per administrar i editar dinàmicament dades de text per millorar l'optimització i el rendiment del codi.
# Extensible i flexible: els scripts es poden escriure fàcilment i ampliar fàcilment perquè els paràmetres d'extensió proporcionen eines per adaptar-se a situacions diferents.