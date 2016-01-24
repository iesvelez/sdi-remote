#!/bin/bash
if [ $UID != 0 ]; then sudo "$0" $*; exit; fi


# Programar aplicación al inicio de sesión
cp scripts/sdi-server.desktop.txt /etc/xdg/autostart/sdi-server.desktop
mkdir /home/scripts

# Colocar script de lanzamiento del servicio
cp scripts/sdi-server.sh /home/scripts/
chmod a+x /home/scripts/sdi-server.sh

# Copiar archivo de configuración
cp scripts/sdi.conf /home/scripts/sdi.conf
chmod a+r /home/scripts/sdi.conf
