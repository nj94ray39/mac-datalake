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

echo "Staging JDK"
mkdir -p /tmp/repo/jdk/${jdk_ver}

aws s3 cp $s3_S3BucketAndPrefix/repo/jdk/${jdk_ver}.tar.gz /tmp/repo/jdk/${jdk_ver}

echo "Done..."