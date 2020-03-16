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

# Setup root profile
echo "Setting up root profilee"

if [ -f /arturo/scripts/env/aliases_root ]
then
  echo "" >> /root/.bash_profile
  echo "# add useful aliases" >> /root/.bash_profile
  echo "". /arturo/scripts/env/aliases_root* >> /root/.bash_profile
fi
echo "Done..."