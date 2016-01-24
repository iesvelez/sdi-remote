# Establecer nombre de equipo
~~~
sudo avahi-set-host-name miequipo
~~~

# Obtener la IPv4 de un equipo
~~~
avahi-resolve -4 --name miequipo.local
~~~



# Buscar todos los servicios
~~~
avahi-browse -ta
~~~

# Buscar todos los servicios sin consultar su tipo en la base de datos local
~~~
avahi-browse -tak
~~~

# Buscar todos los servicios que no sean locales (que no estén en mi equipo)
~~~
avahi-browse -tal
~~~

# Buscar servidores web
~~~
avahi-browse -t _http._tcp
~~~

# Buscar servidores web y resolver detalles del mismo
~~~
avahi-browse -tr _http._tcp
~~~

# Buscar servicio por nombre
~~~
avahi-browse -trpk _http._tcp | grep MiServicio | grep =
~~~

# Buscar servicio por nombre y obtener IPv4 del anfitrión
~~~
avahi-browse -trpk _http._tcp | grep MiServicio | grep = | grep IPv4 | cut -d ";" -f 8
~~~



# Publicar un servicio (hasta que termine el proceso avahi-publish)
~~~
avahi-publish -s MiServicio _http._tcp  12345 "Aquí está"
~~~

# Publicar un servicio (hasta que termine el proceso avahi-publish)
~~~
avahi-publish -s MiServicio _http._tcp  12345 "Aquí está" "path=/ruta/a/servicio"
~~~

# Publicar mediante archivo de configuración XML
`/etc/avahi/services/miservicio.service`:

	<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
	<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
	<service-group>
	  <name replace-wildcards="yes">Mi Servicio en %h</name>
	  <service>
		<type>_http._tcp</type>
		<port>12345</port>
		<txt-record>path=/ruta/a/servicio</txt-record>
	  </service>
	</service-group>

