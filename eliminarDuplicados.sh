#!/bin/bash
# Idea original de:
# https://dosnlinux.wordpress.com/2007/02/18/fdupes-tutorial/
carpeta=$1
#carpeta2=$2
lista='duplicados'
eliminar='eliminar'

fdupes -r $carpeta | tee $carpeta/$lista
fdupes -rf $carpeta | tee $carpeta/$eliminar
sort $carpeta/$eliminar | uniq | grep -v '^$' > $carpeta/eliminar.ordenado

printf "Continuar [S/n]"
read continuar

if [ "$continuar" != 'n' ]; then
while read file
do
# mv --backup=numbered $carpeta/eliminar.ordenado
printf "\n$file"
done
else
 printf "\nNingún archivo ha sido eliminado\n"
fi
