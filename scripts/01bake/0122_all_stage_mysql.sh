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

echo "Staging MYSQL"

mkdir -p /tmp/repo/mysql
aws s3 cp $s3_S3BucketAndPrefix/repo/mysql/mysql-connector-java-5.1.45.tar.gz /tmp/repo/mysql/

echo "Done..."