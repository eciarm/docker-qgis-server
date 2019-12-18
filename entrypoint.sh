#!/usr/bin/env bash

# Choose config file
QGIS_CONF_FILE=${QGIS_CONF_FILE:-/etc/apache2/conf-available/001-qgis-server.conf}

echo "Use config file ${QGIS_CONF_FILE}"

ln -s ${QGIS_CONF_FILE}  /etc/apache2/conf-enabled/001-qgis-server.conf

exec "$@"

