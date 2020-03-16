#!/bin/sh
##################################################
#
#	Author:
#		 Macquarie Group
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

# Run common environment file
. /arturo/scripts/env/stage_script.env

# Install CM agent
echo "Installing CM Agent"
cd /tmp/repo/cm/${cm_ver}
yum -y --nogpgcheck localinstall cloudera-manager-agent-*.el7.x86_64.rpm cloudera-manager-daemons-*.e17.x86_64.rpm

# Stop agent
service cloudera-scm-agent stop

# Disable automatic startup
chkconfig cloudera-scm-agent off

echo "Done..."