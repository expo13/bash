#!/bin/bash

#make necessary dirs
mkdir -p bin/
mkdir -p build/

#Check length of arguments
if [ $# -eq 0 ]
  then
	echo "No arguments supplied - Compiling All"
	echo "Compiling code/ and these source files: $(head -n 1 ./lib/classpath)"
	javac -cp .:lib/ -d bin/ $(head -n 1 ./lib/classpath) code/*.java
	jar cfm build/ConfidenceTree.jar META-INF/MANIFEST.MF -C bin/ /com/
	cp *.conf build/
else
	echo "Compiling - $1"
	javac -cp code/ -d bin/ $1
fi

