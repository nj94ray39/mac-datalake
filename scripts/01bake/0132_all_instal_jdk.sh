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

echo "Staging JDK"
cd /tmp/repo/jdk/${jdk_ver}
mkdir /usr/java/
chmod 755 /usr/java
tar xvf ${jdk_ver}.tar.gz -C /usr/java/
mv /usr/java/zulu8.36.0.1-ca-jdk8.0.202-linux_x64/ /usr/java/${jdk_ver}

# Update TLS algorithms
sed -i 's/jdk.tls.disabledAlgorithms.*/jdk.tls.disabledalgorithms=SSLV3, RC4, MD5withRSA, DH keySize < 768, 3DES_EDE_CBC, TLSV1, TLSV1.1/' /usr/java/${jdk_ver}/jre/lib/security/java.security

JAVA_HOME=/usr/java/${jdk_ver}
echo "Configure JAVA_HOME"
echo "export JAVA_HOME=${JAVA_HOME}" >> /root/.bash_profile
echo "export PATH=$JAVA_HOME/bin: $PATH" >> /root/.bash_profile
echo "export JAVA_HOME=${JAVA_HOME}" » /etc/profile
echo "export PATH=$JAVA_HOME/bin: $PATH" >> /etc/profile
source /etc/profile
source /root/.bash_profile

echo "Done..."