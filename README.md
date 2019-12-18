## QGIS Server for Docker

A simple docker container that runs QGIS 3 Server

This image uses the [ubuntu:bionic docker official image](hhttps://hub.docker.com/_/ubuntu)  as its base.

**Note:**  not intended for use in a production environment

***

## Usage
To  use this image:

	docker pull eciarm/qgis-server

## Build

To build the image from master branch:

	docker build -t eciarm/qgis-server git://github.com/eciarm/docker-qgis-server
	
	
To build from Dockerfile

	./build.sh
	
## Run

Simple run a container

	docker run --name "qgis-server" -p 8080:80 -d -t eciarm/qgis-server
	
Run a container mounting on host a volume that contains qgis projects 

	docker run --name "qgis-server" \
	    -v /qgs_projects:/home \
	    -p 8080:80 -d -t eciarm/qgis-server
	    
Run a container mounting on host a volume for output of apache logs 

	docker run --name "qgis-server" \
	    -v /host_qgs_projects:/home \
	    -v /host_qgs_logs:/var/log/apache2 \
	    -p 8080:80 -d -t eciarm/qgis-server
	    
## Service 

GetCapabilities example: qgis exposes test.qgz from local volume /qgs_projects :

 [http://localhost:8080/test?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities](http://localhost:8080/test?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities) 
