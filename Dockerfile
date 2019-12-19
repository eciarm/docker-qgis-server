FROM ubuntu:bionic
LABEL maintainer="eciarm"

#################COPY build /build/scripts

ENV DEBIAN_FRONTEND noninteractive
#################CMD ["sh", "-c", "echo ${DEBIAN_FRONTEND}"]

## apt-get
RUN dpkg-divert --local --rename --add /sbin/initctl \
    && apt-get -y update \
    && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg \
    --no-install-recommends apt-utils

## Add repo qgis.org
RUN echo "deb http://qgis.org/ubuntu bionic main" >> /etc/apt/sources.list

## Import qgis.org gpg key
ADD build/qgis.gpg.key qgis.gpg.key
ADD build/qgis.gpg.keyid qgis.gpg.keyid
RUN cat qgis.gpg.key | gpg --import \
    && gpg --export --armor $(cat qgis.gpg.keyid | tail -1) | apt-key add -

## Install Apache and QGIS, remove apt-get lists
RUN apt-get -y update \
    && apt-get -y upgrade python3 \
    && apt-get install -y \
    qgis \ 
    qgis-server \
    qgis-plugin-grass \
    apache2 \
    libapache2-mod-fcgid \
    unzip \
    && rm -rf /var/lib/apt/lists/*

## Install QGIS 3 Server Plugins
## wfsOutputExtension: QGIS Server Plugin to add Output Formats to WFS GetFeature request
RUN mkdir -p /opt/qgis-server && mkdir -p /opt/qgis-server/plugins
ADD https://github.com/3liz/qgis-wfsOutputExtension/archive/master.zip /opt/qgis-server/plugins
RUN unzip /opt/qgis-server/plugins/master.zip -d /opt/qgis-server/plugins/ \
    && mv /opt/qgis-server/plugins/qgis-wfsOutputExtension-master /opt/qgis-server/plugins/wfsOutputExtension

## Disable/enable Apache sites
RUN export LC_ALL="C" && a2enmod fcgid && a2enconf serve-cgi-bin && a2enmod headers && a2enmod rewrite
RUN a2dissite 000-default
ADD build/001-qgis-server.conf /etc/apache2/sites-available/001-qgis-server.conf
RUN a2ensite 001-qgis-server
EXPOSE 80

## Entrypoint
#################COPY entrypoint.sh /entrypoint.sh
#################ENTRYPOINT ["/entrypoint.sh"]

## Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]
