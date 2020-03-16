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

# Load secrets
. /arturo/config/secrets.env

# Configure ssh without password
echo "Setting up ssh without password"
cp /arturo/config/ssh_keys/id_rsa.pub /root/.ssh/

openssl rsa -in 7arturo/config/ssh_keys/id_rsa -out /root/.ssh/id_rsa -passin pass:"$(kms_decrypt S{id_rsa_passphrase_enc})"

chmod 600 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

echo "Done..."