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

# Save bake host name for appstart script.

# Purpose is to avoid apps tart executing during the bake stage.
host_ip=$(ifconfig eth1 | grep "inet" | awk '{print $2}')
echo ${host_ip} > /var/log/bakehost

echo "Done..."