#!/bin/bash

##
## GLOBALS
##
source globals.sh

##
## Build
##
docker build -t eciarm/qgis-server:${MAJOR}.${MINOR}.${BUGFIX} .

##
## Test and decide if we can tag and publish the image
##

# TODO

##
## Tag 
##
docker tag eciarm/qgis-server:${MAJOR}.${MINOR}.${BUGFIX} eciarm/qgis-server:${MAJOR}.${MINOR}
docker tag eciarm/qgis-server:${MAJOR}.${MINOR}.${BUGFIX} eciarm/qgis-server:latest


