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

# Run common environment file
. /arturo/scripts/env/stage_script.env

# Setup root profile
echo "Setting up ec2-user profile"

echo "Adding figlet banner"
env=$(echo ${pipelineBranch%-*} | tr '[:lower:]' '[:upper:]')
banner="CDH ${env} ENV"

if [ -f /usr/local/bin/figlet ]; then
    echo "# CDH banner" >> /home/ec2-user/.bash_profile
    echo "figlet \"${banner}\"" > /home/ec2-user/.bash_profile
  else
    echo "# CDH banner" >> /home/ec2-user/.bash_profile
    echo "echo ${banner}" >> /home/ec2-user/.bash_profile
fi
echo "Done.."