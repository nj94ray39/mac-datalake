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
/arturo/scripts/env/stage_script.env

echo "Staging CM rpms"

mkdir -p /tmp/repo/cn/$(cm_ver)

aws s3 sync $s3_S3BucketAndPrefix/repo/cdh5/cm/${cm_ver}/ /tmp/repo/cm/${cm_ver}/

echo "Done..."