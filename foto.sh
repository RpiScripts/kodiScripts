#!/bin/bash
# ~/kodiScripts/foto.sh
# Creado: 25/03/2018

## FUNCIONES ##
# Saca una foto y la guarda en el directorio /home/pi/camara

# Variables
define -r DIR_CAMARA='/home/pi/camara'
fecha=$(date +"foto-%Y%m%d-%H%M%S")

echo $fecha.jpg
raspistill -o $DIR_CAMARA/$fecha.jpg
