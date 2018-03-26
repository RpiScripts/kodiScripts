#!/bin/bash
# /bin/josea/carpetas.sh
# Creado: 17/08/2017

# FUNCIONAMIENTO
# Crea carpetas para organizar la biblioteca multimedia
# Necesita cambiar la extensión del archivo de video

## VARIABLES ##
[[ ! -z $1 ]] && extension="$1" || extension="avi"

while read pelicula
do
 carpeta="${pelicula#./*}"
 carpeta="${carpeta%.*}"

 mkdir "$carpeta"
 sleep 0.1
 mv ./"$carpeta"*.* ./"$carpeta"/
done < <(find . -maxdepth 1 -type f -name "*.$extension" | sort | uniq)
