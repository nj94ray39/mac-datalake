#!/bin/sh
##################################################
#
#	Author:
#		 BeCenturien Group
#
#	Description:
#		The script marks the start of bake stage.
#
#	Usage:
#		bash 0100_all_start.sh
#
#	Changes:
#		1.0	Nihal Jangave
#
#
#################################################

# Exit if an error is encountered.
set -e

echo "Installing MYSQL JDBC driver"

cd /tmp/repo/mysql
tar zxvf mysql-connector-java-5.1.45.tar.gz
mkdir -p /usr/share/java/
cp mysql-connector-java-5.1.45/mysql-connector-java-5.1.45-bin.jar /usr/share/java/mysql-connector-java.jar

echo "Done..."