# Servidor
~~~
avahi-publish -s SDI1 _vnc._tcp  5900 "Solución Digital Integrada 1"
~~~


# Publicar mediante archivo de configuración XML
`/etc/avahi/services/sdi.service`:

	<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
	<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
	<service-group>
	  <name replace-wildcards="yes">SDI1 en %h</name>
	  <service>
		<type>_vnc._tcp</type>
		<port>5900</port>
		<txt-record>Solución Digital Integrada</txt-record>
	  </service>
	</service-group>


# Buscar servicio por nombre y obtener IPv4 y puerto del anfitrión
~~~
avahi-browse -trpk _vnc._tcp | grep SDI1 | grep = | grep IPv4 | cut -d ";" -f 8
avahi-browse -trpk _vnc._tcp | grep SDI1 | grep = | grep IPv4 | cut -d ";" -f 9
~~~


# Clientes VNC

* xtightvncviewer
* xvnc4viewer
* ssvnc
* remmina


# Servidores VNC

* x11vnc
* vino
* x2vnc

