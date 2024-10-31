# Fix Your Broken/EOLd CentOS 7 Yum Repos
Having problems patching/upgrading your CentOS7 system with yum?

Red Hat officailly [EOLd CentOS 7 as of June  30th 2024](https://www.redhat.com/en/blog/centos-linux-has-reached-its-end-life-eol). In doing so, this broke yum and our ability to apply any/all yum based updates or security patches.

If doing a "yum list ; echo "STATUS=$?" results in a STATUS=1, then you're broken.

## TL;DR

Watch [this video](https://go.vacr.io/fix-centos7-video) for more info.
Run this one liner as root to fix your system:
```
# source <(curl -Ls go.vacr.io/fix-centos7-yum)
```

> WARNING: The script will disable/delete ALL repos (other than Vault). If you have things like google-chrome or other repos running out of /etc/yup.repos.d/, then you might want to backup all of /etc/yum/yum.repos.d/ before running this sledge-hammer of a little hack-script. You have been warned.

## Details

This is not a long term solution.  CentOS7 is still EOLd and will not be getting security updates, so you still need to move to a different distro (unless some community group steps up with a security updated repo)

[My script](https://raw.githubusercontent.com/Tweeks-va/fix-EOLd-Centos7-repos/refs/heads/main/centos-7-yum-repo-fix.sh) essentally:
* Preserves the Vault repo.
* Deletes all other repos.
* Enables the Vault C7.8.2003-* repos (all fo them), and then
* Runs a "yum list" test.

If the end result shows STATUS=0, then you're good to go.

Peek at the script before running it, but it should be able to be automatically pulled in and executed from the command line like this (run as root):
```
$ sudo su -
# source <(curl -Ls go.vacr.io/fix-centos7-yum)
```

Don't come crying to me if this script damages your system. You shouldn't run system level scripts as root without peeking inside and groking exactly what the script is doing. Suck it up.

You have been warned..

