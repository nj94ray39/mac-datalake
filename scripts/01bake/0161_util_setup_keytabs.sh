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

# Download Keytabs
mkdir -p /app/opt/cloudera/keytabs
aws s3 cp $s3_S3BucketAndPrefix/cm/keytabs /app/opt/cloudera/keytabs --recursive
chown -R cloudera-scm:cloudera-scm /app/opt/cloudera/keytabs
chmod 744 /app/opt/cloudera/keytabs/custom_script.sh

echo "Done..."