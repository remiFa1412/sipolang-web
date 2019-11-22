#!/bin/sh

# Service configuration
java_bin=`which java`
java_min=64M
java_max=64M
java_metaspace=64M
APP_NAME=sipolang-web
WORKINGDIR=/app/servers/$APP_NAME
PIDDIR=/app/servers/var/run
f_pid=$PIDDIR/$APP_NAME.pid
JAR_NAME=$APP_NAME.jar
SPRING_CONFIG_LOCATION=application.properties
CONFIG_LOCATION=/app/servers/configuration/hostname.properties
LOGGING_CONFIG=logback.xml

# Change the directory
export startDir=`pwd`
cd $WORKINGDIR

# Start the Java jar
$java_bin -jar -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=7152,suspend=n -server -Duser.timezone=GMT -Ddefault.config.dir=$startDir -Dfile.encoding=ISO8859_1 -Xms${java_min} -Xmx${java_max} -XX:MaxMetaspaceSize=${java_metaspace} $JAR_NAME --spring.config.location=$SPRING_CONFIG_LOCATION,$CONFIG_LOCATION --logging.config=$LOGGING_CONFIG > /dev/null &

# Allow the service to properly start first
sleep 3

# Write the Process ID File
PID=$!
if ! [ -z $PID ];then
  echo $PID > $f_pid
fi