#!/bin/sh

#TODO parameterize the project name which should be pumped into the build script as well
#as the manifest file, and the conf file

DEFAULT_JAVA_VERSION=
DEFAULT_BUILD_SCRIPT=./create_expo_java_project.sh
#ensure java version

mkdir -p code/
mkdir -p bin/
mkdir -p build/
mkdir -p META-INF/
mkdir -p lib/
#command to make MANIFEST FILE

#create conf file
touch $1.conf

#create build script
cat $DEFAULT_BUILD_SCRIPT > build.sh

#run a manifest command setting main class to input project name java file
