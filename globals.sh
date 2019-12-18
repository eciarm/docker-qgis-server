##
## GLOBALS for use by build, test, run etc scripts
##
MAJOR=3
MINOR=10
BUGFIX=0
TESTPORT=9909

#export http_proxy=http://proxy.site.it:3128
#export https_proxy=http://proxy.site.it:3128
#export no_proxy=localhost,127.0.0.1
#export HTTP_PROXY=http://proxy.site.it:3128
#export HTTPS_PROXY=http://proxy.site.it:3128
#export NO_PROXY=localhost,127.0.0.1

# $$ at the end will add a random number to the server
TESTSERVER=qgis-server-test$$
URL=http://localhost:${TESTPORT}/
PROJECT=`pwd`/../project-qgis3
TESTIMAGE=/tmp/test$$.jpg

