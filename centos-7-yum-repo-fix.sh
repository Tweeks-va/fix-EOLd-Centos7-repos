#!/bin/bash
## By tweeks@VirginiaCyberRange.org
## WARNING: This script disables all CentOS7 yum repos except the Vault C7.8.2003 repos.
## DO NOT RUN THIS on any distro other than CentOS7.
## Must run as root.

if [[ $UID != "0" ]]; then
	echo ERROR: Cant run as non root/UID-0
	exit 1
fi
echo
echo
## Show yum list status.. Comment out the "read" line if you want to run this script
## with no human interaction.
yum list ; echo "STATUS=$?"
echo "If STATUS=1, then yum is not working.  If STATUS=0, then I recommend"
echo "hitting CTRL-C and aborting this..."
echo "... hit enter if you're sure you want to contine..."
## Pauses for human input (ENTER to run.. CTRL-C to abort)
read x
if [ -f /etc/yum.repos.d/CentOS-Vault.repo ]; then
	cd /etc/yum.repos.d/
	chattr +i CentOS-Vault.repo
	## Nuke it from space. It's the only way to be sure.. ;)
	/bin/rm *
	chattr -i CentOS-Vault.repo
	yum-config-manager --enable C7.8.2003-*
	yum list ; echo "STATUS=$?"
	cd -
 else
 	echo "ERROR: CentOS-Vault.repo not found.. aborting."
  	exit 1
fi
