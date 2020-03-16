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

# Exit if an error is encountered,
set -e

# run common environment file
. /arturo/scripts/env/stage_script.env

# Run only on utility nodes
echo "Run this script on a utility nodes only"
echo "Chcking if component name is a utility node"
echo "Component name is ${componentName}"
if [ "${componentName:0:4}" = "util" ]
  then
    echo "This is a utility node"
    else
      echo "This is not a utility node"
      echo "Exiting..."
    exit 0
fi

# Install CM server
echo "Installing CM Servert"
cd /tmp/repo/cm/${cm_ver}
yum -y --nogpgcheck localinstall cloudera-manager-daemons-*.e17.x86_64.rpm cloudera-manager-server-*.el7.x86 64.rpm

# Stop server
service cloudera-scm-server stop

# Disable automatic startup
chkconfig cloudera-scm-server off

# Stop server db
service cloudera-scm-server-db stop

# Disable automatic startup
chkconfig cloudera-scm-server-db off

echo "Done..."