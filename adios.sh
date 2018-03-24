#!/bin/sh
# /home/pi/bin/adios
# MOD: 02/11/2017

# Localiza una ip, cuando deja de estar en línea cambia el valor del pin solicitado

## PENDIENTE ##
# No funciona -> errores en los loops (for)

# Direcciones ip
jose='192.168.1.123'
fatima='192.168.1.125'
reproductor='192.168.1.161'

ip=$1
pin=$2

# Introduzco la ip del equipo en la vaiable $ip
if [ $ip = 'jose' ]; then
 ip="$jose"
elif [ $ip = 'fatima' ]; then
 ip="$fatima"
elif [ $ip = 'reproductor' ]; then
 ip="$reproductor"
fi


# Veces que tiene que fallar la localización antes de apagar el sistema
ciclos=3
# Tiempo de espera para cada comprobación
espera=60
# Tiempo de espera para dar tiempo a cerrar el sistema
cierre=120

# CONTADORES
# j=1

# Si no hay respuesta del ping entonces no continúo porque ya se ha apagado o marchado.
until ping -c1 $ip
do
  for j in 1 2 3 4 5 6 7 8 9 10 11
  do
    printf "No disponible la señal de %s. Ciclo %s\n" $1 $j
    sleep 2
  done

 printf "Abortando el programa\n"
 exit

done

for k in 1 2 3 4 5 6 7 8 9 10 11 12 13
do
  while ping -c1 $ip
  do
   printf "%s todavía al alcance. >> %s\n" $1 `date +"H:M:S"`
   sleep $espera
  done
 printf "Sin señal de $1. Comprobando de nuevo.\n"
done

printf "Ciclos de espera concluidos. Cerrando el sistema\n"
sleep $cierre

# Llama al programa rpin con la opcion 3 y pin=$pin
./rpin 3 $pin
