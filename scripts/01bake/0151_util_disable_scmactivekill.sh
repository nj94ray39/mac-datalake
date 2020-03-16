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

# Disable SCM Active Kill
echo "Disabling SCM Active Kill"
cp /etc/default/cloudera-scm-server /etc/default/cloudera-scm-server.orig
sed -i '/^export CMF_JAVA_OPTS/s/"$/ -Dcom.cloudera.server.cmf.components.scmActive.killonError=false"/' /etc/default/cloudera-scm-server

# Add truststore config for CM
echo "Adding truststore config for CM"
sed -i '/^export CMF_JAVA_OPTS/s/"$/ -Djavax.net.ssl.trustStore=\/opt\/cloudera\/security\/pki\/truststore. jks -Djavax.net.ssl.trustStorePassword=changeit"/' /etc/default/cloudera-scm-server
echo "/etc/default/cloudera-scm-server updated"
grep CMF_JAVA_OPTS /etc/default/cloudera-scm-server

echo "Done..."