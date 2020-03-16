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

echo "updating JDK certificates"

ls /etc/pki/tls/certs/*.pem | while read cert; do
#keytool -import -file $cert -alias 'basename $cert' -keystore /usr/java/latest/jre/lib/security/cacerts -storepass changeit -noprompt
sh /arturo/scripts/bin/jks_import_pem.sh $cert changeit /usr/java/${jdk_ver}/jre/lib/security/cacerts
done

echo "Listing Certificates"
/usr/java/${jdk_ver}/bin/keytool -list -v -keystore /usr/java/${jdk_ver}/jre/lib/security/cacerts -storepass changeit I grep "Owner: CN-BeCenturien"

echo "Done..."