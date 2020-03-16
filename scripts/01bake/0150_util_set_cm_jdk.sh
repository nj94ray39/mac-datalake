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

# Run common enviroment file
. /arturo/scripts/env/stage_script.env

# Configure JAVA_HOME
JAVA_HOME=/usr/java/${jdk_ver}
echo "Configure CM JAVA_HOME"
/bin/cp -f /etc/default/cloudera-scm-server /etc/default/cloudera-scm-server.orig
echo "" >> /etc/default/cloudera-scm-server
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/default/cloudera-scm-server
echo "" >> /etc/default/cloudera-scm-server
echo "JAVA_HOME in /etc/default/cloudera-scm-server upeated"
grep JAVA_HOME /etc/default/cloudera-scm-server

echo "Done..."