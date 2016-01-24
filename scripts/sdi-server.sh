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

# Publicar servicio con Zeroconf
HOST=`hostname`
avahi-publish -s $DEVICE _vnc._tcp $PORT "Solución Digital Integrada ($HOST)" &

# Lanzar VNC
x11vnc -passwd "$AUTH" -rfbport $PORT -forever &
