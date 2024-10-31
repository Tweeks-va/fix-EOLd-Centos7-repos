# Fix Your Broken/EOLd CentOS 7 Yum Repos
Having problems patching/upgrading your CentOS7 system with yum?

Red Hat officailly [EOLd CentOS 7 as of June  30th 2024](https://www.redhat.com/en/blog/centos-linux-has-reached-its-end-life-eol). In doing so, this broke yum and our ability to apply any/all yum based updates or security patches.

If doing a "yum list ; echo "STATUS=$?" results in a STATUS=1, then you're broken.

Running my script here as root will make the Vault repo your default repo, and delete all other repos.

## TL;DR

Watch [this video](https://go.vacr.io/fix-centos7-video)


## Details

When run as root, the script will disable ALL repos (other than Vault), so use with caution.  If you have things like google-chrome or other repos running out of /etc/yup.repos.d/, then you might want to back those up before running my dangerous little hack-script.

> NOTE: This scrpt is not a long term solution.. It's a short term "fix" or work around so you can patch your system. CentOS7 is still EOLd and you need to find another distro.

[My script](https://raw.githubusercontent.com/Tweeks-va/fix-EOLd-Centos7-repos/refs/heads/main/centos-7-yum-repo-fix.sh) essentally:
* Preserves the Vault repo.
* Deletes all other repos.
* Enables the Vault C7.8.2003-* repos (all fo them), and then
* Runs a "yum list" test.

If the end result shows STATUS=0, then you're good to go.

Peek at the script before running it, but it should be able to be automatically pulled in and executed from the command line list this (run as root):
'''
$ sudo su -
# source < <(curl -Ls go.vacr.io/fix-centos7-yum)
'''

Don't come crying to me if this script damages your system. You shouldn't run system level scripts as root without peeking inside and groking exactly what the script is doing. Suck it up.

You have been warned..

