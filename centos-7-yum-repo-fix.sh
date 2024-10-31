#!/bin/bash
if [[ $UID != "0" ]]; then
	echo ERROR: Cant run as non root/UID-0
	exit 1
fi
echo
echo
yum list ; echo "STATUS=$?"
echo "If STATUS=1, then yum is not working.  If STATUS=0, then I recommend"
echo "hitting CTRL-C and aborting this..."
echo "... hit enter if you're sure you want to contine..."
read x
cd /etc/yum.repos.d/
chattr +i CentOS-Vault.repo
/bin/rm *
chattr -i CentOS-Vault.repo
yum-config-manager --enable C7.8.2003-*
yum list ; echo "STATUS=$?"
cd -

