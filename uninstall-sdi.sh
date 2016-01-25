#!/bin/bash
if [ $UID != 0 ]; then sudo "$0" $*; exit; fi


rm ~/Escritorio/sdi-client.desktop
rm /etc/xdg/autostart/sdi-server.desktop
rm /home/scripts/sdi*
rmdir /home/scripts
