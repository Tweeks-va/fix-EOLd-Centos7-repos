CentOS 7 is officially EOLd as of June 2024.. 

In doing so, this broke yum and your ability to apply any/all yum based updates.

If doing a "yum list ; echo "STATUS=$?" results in a STATUS=1, then you're broken.

Running my script here as root will make the Vault repo your default repo, and delete all other repos.

NOTE: This is not a "fix".. because no other repos (other than Vault) will work.  So if you have things like google-chrome or other repost running out of /etc/yup.repos.d/, then you might want to back those up before running my dangerous little hack-script.

My script essentally preserves the Vault repo.
Deletes all other repos.
Enables the C7.8.2003-* repos (all fo them)
and runs a "yum list" test.
If the end result shows STATUS=0, then you're good to go.

Don't come crying to me if this script damages your system.
You shouldn't run system level scripts as root without peeking inside and understanding exactly what they're doing.

You have been warned..

