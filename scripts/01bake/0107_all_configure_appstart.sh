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
# Enable appstart service

echo "Enabling appstart service"

cp /arturo/scripts/systemd/appstart /etc/rc.d/init.d/appstart
cp /arturo/scripts/systemd/appstart.service /etc/systemd/system/appstart.service
chmod 755 /etc/rc.d/init.d/appstart
systemctl enable appstart.service

echo "Done... "