#! /bin/bash

########################################################################
#
# Configuración
#
########

source /home/scripts/sdi.conf


########################################################################
#
# Habilitar servicio
#
########

# Averiguar IPv4
IP=`ip -4 a | grep 192 | awk '{print $2}' | cut -d "/" -f 1`

# Publicar servicio con Zeroconf
HOST=`hostname`
avahi-publish -s $DEVICE _vnc._tcp $PORT "Solución Digital Integrada ($IP)" &

# Lanzar VNC
x11vnc -passwd "$AUTH" -rfbport $PORT -forever &
