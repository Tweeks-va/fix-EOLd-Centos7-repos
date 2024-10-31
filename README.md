# Fix Your Broken/EOLd CentOS 7 Yum Repos
Having problems patching/upgrading your CentOS7 system with yum?

Red Hat officailly [EOLd CentOS 7 as of June  30th 2024](https://www.redhat.com/en/blog/centos-linux-has-reached-its-end-life-eol). In doing so, this broke yum and our ability to apply any/all yum based updates or security patches.

If doing a "yum list ; echo "STATUS=$?" results in a STATUS=1, then you're broken.

Running my script here as root will make the Vault repo your default repo, and delete all other repos.

> NOTE: This is not a "fix".  When run as root, the script will disable ALL repos (other than Vault), so use with caution.  If you have things like google-chrome or other repos running out of /etc/yup.repos.d/, then you might want to back those up before running my dangerous little hack-script.

My script essentally:
* Preserves the Vault repo.
* Deletes all other repos.
* Enables the Vault C7.8.2003-* repos (all fo them), and then
* Runs a "yum list" test.

If the end result shows STATUS=0, then you're good to go.

Don't come crying to me if this script damages your system. You shouldn't run system level scripts as root without peeking inside and groking exactly what the script is doing. Suck it up.

You have been warned..

