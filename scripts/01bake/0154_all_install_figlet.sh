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

# Install figlet
if [ -f /arturo/tools/figlet-2.2.5.tar.gz ]; then
  yum -y install gcc
  cd /arturo/tools
  tar xvfz figlet-2.2.5.tar.gz
  cd figlet-2.2.5
  make
  cp -rf fonts /usr/local/share/figlet
  cp figlet /usr/local/bin
  echo "Figlet installed"
  else
    echo "Figlet tar.gz missing"
    echo "Figlet not installed"
fi
echo "Done."