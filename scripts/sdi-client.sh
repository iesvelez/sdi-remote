#! /bin/bash

########################################################################
#
# Configuración
#
########

source /home/scripts/sdi.conf


########################################################################
#
# Conectar con servidor
#
########

#SERVER=`avahi-browse -trpk _vnc._tcp | grep $DEVICE | grep = | grep IPv4 | cut -d ";" -f 8`
#PORT=`avahi-browse -trpk _vnc._tcp | grep $DEVICE | grep = | grep IPv4 | cut -d ";" -f 9`

SERVER=`avahi-browse -trpk _vnc._tcp | grep $DEVICE | grep = | tail -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1`
PORT=`avahi-browse -trpk _vnc._tcp | grep $DEVICE | grep = | tail -n 1 | cut -d ";" -f 9`

echo "Conectando con $SERVER:$PORT..."
echo $AUTH | xtightvncviewer -autopass $SERVER:$PORT
