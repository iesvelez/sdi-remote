# sdi-remote

Conjunto de shell scripts para automatizar la búsqueda y control remoto de la SDI (Solución Digital Integral) desde el equipo del profesor.

La Solución Digital Integral (SDI) consiste en una Pizarra Digital compuesta por varios elementos:

* Pizarra Digital Interactiva SmartBoard SB-800
* Proyector SmartBoard V30
* Sistema de sonido de alta definición ubicado en la parte superior de la pizarra
* Equipo cliente intel NUC
* Conexión a Andared mediante router inalámbrio o PLC.

Todos estos elementos, están integrados en un soporte que va anclado a la pared, obteniendo como resultado una especie de *tablet* gigante.

## Ventajas

Este nuevo tipo de pizarra digital tiene como ventajas, principalmente:

* Es más fácil de montar.
* No requiere de alargadores USB/audio/vídeo para conectar al equipo situado en la mesa del profesor.
* No requiere de splitter de vídeo.
* Ocupa menos espacio y no hay tanto lío de cables.
* Minimiza los posibles fallos debidos a problemas de conexión (USB/audio/vídeo) y con ello las labores de mantenimiento.

## Inconvenientes

Al no disponer disponer de teclado ni ratón físicos:

* El profesor tiene que utilizar el teclado en pantalla cuando necesite escribir algo, lo cual resulta realmente lento e incómodo. Además implica un problema de seguridad en aquellos casos en los que sea necesario teclear información sensible como contraseñas.
* Si el panel táctil no responde, no es posible calibrar la pantalla. Para ello hay que recurrir a un teclado y ratón conectados por USB.

## Funcionamiento del control remoto

Si tenemos la suerte de disponer de otro ordenador de aula en la mesa del profesor, podemos utilizar VNC para controlar remotamente la SDI y así superar las limitaciones descritas anteriormente. Sin embargo, esta solución, también trae consigo ciertos problemas que hay que resolver:

1. No conocemos, a priori, la dirección IP de la SDI ni el puerto donde está funcionando el servicio.
2. Queremos que el profesor se conecte a la SDI de su aula (no a la de otro compañero) y que sea de la forma más sencilla posible. Por ejemplo, haciendo clic en un icono.

Para resolver estos problemas utilizaremos Avahai/Zeroconf. Mediante este protocolo publicaremos la disponibilidad del servicio VNC en la SDI y posteriormente podremos buscarlo por nombre (p. ej. "SDI-05") desde el equipo del profesor.

Seguidamente, colocaremos un lanzador en el escritorio para que cuando el profesor haga clic en él se ejecute un script que busque la SDI del aula correspondiente y se lleve a cabo mediante algún cliente VNC la conexión a la IP y puerto apropiados.

## Utilidades necesarias

* avahi-publish (publicar servicios)
* avahi-browse (buscar servicios)
* x11vnc (servidor VNC)
* xtightvncviewer (cliente)

## Instrucciones

### Instalar el servicio en la SDI

Para instalar los scripts en la SDI:

1. Ejecutar `install-sdi-server.sh`
2. Editar `/home/scripts/sdi.conf` para configurar el nombre identificativo de la SDI, el puerto de escucha y la contraseña de conexión.

Una vez instalado, el script se ejecutará automáticamente cada vez que un usuario inicie sesión. Por lo tanto debemos considerar la conveniencia de dejar activado el inicio de sesión automático en la SDI.

### Instalar el cliente en el equipo del profesor

Para instalar los scripts en el equipo del profesor:

1. Ejecutar `install-sdi-client.sh`
2. Editar `/home/scripts/sdi.conf` para configurar el nombre identificativo de la SDI, el puerto de escucha y la contraseña de conexión.

Una vez instalado, aparecerá un lanzador en el escritorio del usuario llamado `Control Remoto SDI`.

