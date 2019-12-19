## QGIS 3 Server for Docker

A simple docker container that runs QGIS 3 Server

This image uses the [Ubuntu bionic Docker Official Image](https://hub.docker.com/_/ubuntu)  as its base. 
QGIS packages from [Ubuntu qgis.org repository](https://qgis.org/ubuntu) are installed at build time.
 

## Notes
 * **Not** intended for use in a production environment
 * The full version of QGIS is updated and determined at the build time.


## Usage
To  use this image:

	docker pull eciarm/qgis-server

## Build

To build the image from master branch:

	docker build -t eciarm/qgis-server git://github.com/eciarm/docker-qgis-server
	
	
To build from Dockerfile

	docker build -t eciarm/qgis-server .
	
## Run

Simple run a container

	docker run --name "qgis-server" -p 8080:80 -d -t eciarm/qgis-server
	
Run a container mounting on host a volume with many QGIS projects 

	docker run --name "qgis-server" \
	    -v /path/of/projects/folder:/home \
	    -p 8080:80 -d -t eciarm/qgis-server
	    
Run a container mounting on host a volume for output of apache logs 

	docker run --name "qgis-server" \
	    -v /path/of/projects/folder:/home \
	    -v /path/of/logs:/var/log/apache2 \
	    -p 8080:80 -d -t eciarm/qgis-server

## Orchestration with docker-compose

 [https://docs.docker.com/compose/](https://docs.docker.com/compose/) 

	    
## Test working

To test if QGIS Server works in a running container, you should have almost a project file in a host local folder mounted with a volume.

Example with demo.qgz:

[http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities&map=/home/demo.qgz
](http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities&map=/home/demo.qgz
) 

The Apache is configured to public same map in another way, without cgi-bin and map path:

[ http://localhost:8080/demo?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities]( http://localhost:8080/demo?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities) 
 

