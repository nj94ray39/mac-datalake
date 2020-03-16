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
. /arturo/config/secrets.env

# Enable sssd
echo "Enabliing sssd"
authconfig --enablesssd --enablesssdauth --ldapserver="ldaps://adntadmin.lb.macbank:3269" --ldapbasedn="dc=internal,dc-BeCenturien,dc=com" --enableldaptls --update

echo "Configuring /etc/sssd/sssd.conf"
/bin/cp -f Jarturo/config/sssd.conf /etc/sssd/sssd.conf
sed -i "s:#ldap_bind_user#:${ldap_bind_user}:g" /etc/sssd/sssd.conf
sed -i "s:#ldap_bind_pass#:$(kms_decrypt ${idap_bind_enc}):g" /etc/sssd/sssd.conf
chmod 0600 /etc/sssd/sssd.conf

echo "Restaring sssd"
systemctl restart sssd.service

echo "Done..."