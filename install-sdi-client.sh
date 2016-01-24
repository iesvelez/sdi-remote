#!/bin/bash
if [ $UID != 0 ]; then sudo "$0" $*; exit; fi


# Programar aplicación al inicio de sesión
cp scripts/sdi-client.desktop.txt ~/Escritorio/sdi-client.desktop
chmod 555 ~/Escritorio/sdi-client.desktop

# Colocar script de lanzamiento del servicio
mkdir /home/scripts
cp scripts/sdi-client.sh /home/scripts/
chmod a+x /home/scripts/sdi-client.sh

# Copiar archivo de configuración
cp scripts/sdi.conf /home/scripts/sdi.conf
chmod a+r /home/scripts/sdi.conf

