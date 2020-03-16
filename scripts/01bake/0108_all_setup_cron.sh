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
echo "Setting up scheduled cron jobs"
for cron_schedule in cron.1minutely cron.5minutely cron.hourly cron.daily cron.weekly cron.monthly
do
  if [ -d /arturo/scripts/${cron_schedule} ]
    then
      echo "Setting up schedule for ${cron_schedule}"
      cp /arturo/scripts/${cron_schedule}/* /etc/${cron_schedule}
      chmod 755 /etc/${cron_schedule}/*
    fi
done
echo "Done..."