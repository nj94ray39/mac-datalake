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

echo "Setting static hostname"
echo "preserve_hostname: true" >> /etc/cloud/cloud.cfg

echo "Done."