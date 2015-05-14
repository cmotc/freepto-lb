# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "" ]; then
    # include .bashrc if it exists
    if [ -f "/home/dyngar-m/.bashrc" ]; then
	. "/home/dyngar-m/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "/home/dyngar-m/bin" ] ; then
    export PATH="/home/dyngar-m/bin:/usr/arm-linux-androideabi/bin:/home/dyngar-m/.bin/android-ndk-r10d:/home/dyngar-m/.bin/android-sdk/tools:/home/dyngar-m/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
fi

