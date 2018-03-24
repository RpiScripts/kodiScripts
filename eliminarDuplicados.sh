#!/bin/bash
# Idea original de:
# https://dosnlinux.wordpress.com/2007/02/18/fdupes-tutorial/
# No tengo claro que funcione

carpeta=$1
#carpeta2=$2
lista='duplicados'
eliminar='eliminar'

# Genero una lista con los duplicados y la muestro por pantalla y la copio en $carpeta/$lista
fdupes -r $carpeta | tee $carpeta/$lista
# Genero la lista omitiendo el primer archivo duplicado, siendo los archivos que quiero eliminar
fdupes -rf $carpeta | tee $carpeta/$eliminar
# Ordeno los resultados de la lista y la vuelvo a guardar en $carpeta/eliminar.ordenado
sort $carpeta/$eliminar | uniq | grep -v '^$' > $carpeta/eliminar.ordenado

printf "Continuar [S/n]"
read continuar

if [ "$continuar" != 'n' ]; then
while read file
do
# Parece qu no va a hacer nada, solo mostrar los archivos a eliminar
# mv --backup=numbered $carpeta/eliminar.ordenado
printf "\n$file"
done
else
 printf "\nNingún archivo ha sido eliminado\n"
fi
