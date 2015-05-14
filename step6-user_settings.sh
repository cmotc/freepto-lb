#! /bin/sh
echo ":'
##Generating the user settings
'"
mkdir -p config/includes.chroot/etc/skel/
echo 'background yes
use_xft yes
xftfont HandelGotD:size=9
xftalpha 0.5
update_interval 5.0
total_run_times 0
own_window yes
own_window_class Conky
own_window_transparent yes
own_window_type normal
own_window_hints undecorated,below,sticky,skip_taskbar
own_window_argb_visual yes  
own_window_argb_value 0
own_window_transparent yes
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager
double_buffer yes
minimum_size 600
maximum_width 600
minimum_height 734
maximum_height 734
draw_shades no
draw_outline no
draw_borders no
draw_graph_borders yes
default_color grey
default_shade_color red
default_outline_color green
alignment bottom_right
gap_x 12
gap_y 48
no_buffers yes
uppercase no
cpu_avg_samples 4
override_utf8_locale no
text_buffer_size 1024

TEXT
${color white}
$sysname $kernel on $machine ${color grey}
Uptime: $alignr ${color green} $uptime ${color grey}
Mean Load: $alignr ${color green} $loadavg
${color white}$processes processes ${color magenta}($running_processes running) ${color green}
CPU0 ${cpu cpu0}% ${color purple}${cpubar cpu0} ${color green}
CPU1 ${cpu cpu1}% ${color purple}${cpubar cpu1}
${color grey}MEM $alignc $mem / $memmax $alignr $memperc%
$membar
swap $alignc $swap / $swapmax $alignr $swapperc%
${swapbar}
${color white}*   Top Processes: by CPU		$alignr Top Processes: by Memory   *${color slate grey}
${top name 1}${top pid 1}${top cpu 1}	${top name 2}${top pid 2}${top cpu 2}	${top name 3}${top pid 3}${top cpu 3} $alignr	${top name 1}${top pid 1}${top mem 1}	${top name 2}${top pid 2}${top mem 2}	${top name 3}${top pid 3}${top mem 3} 
${top name 4}${top pid 4}${top cpu 4}	${top name 5}${top pid 5}${top cpu 5}	${top name 6}${top pid 6}${top cpu 6} $alignr	${top name 4}${top pid 4}${top mem 4}	${top name 5}${top pid 5}${top mem 5}	${top name 6}${top pid 6}${top mem 6}
${top name 7}${top pid 7}${top cpu 7}	${top name 8}${top pid 8}${top cpu 8}	${top name 9}${top pid 9}${top cpu 9} $alignr	${top name 7}${top pid 7}${top mem 7}	${top name 8}${top pid 8}${top mem 8}	${top name 9}${top pid 9}${top mem 9} ${color grey}
${color white} $alignc HDD
${color yellow}/ $alignc ${fs_used /} / ${fs_size /} $alignr ${fs_free_perc /}%
${color dark green}${fs_bar /}
${color yellow}/home $alignc ${fs_used /home} / ${fs_size /home} $alignr ${fs_free_perc /home}%
${color dark green}${fs_bar /home} 
${color green}---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
${color magenta}Hostname $alignr $nodename ${color blue}
eth0: $alignr ${color blue} ${addrs eth0}
${color blue}Inbound: $alignr ${downspeed eth0} kb/s
${color dark blue}${downspeedgraph eth0}
${color blue}Outbound: $alignr ${upspeed eth0} kb/s
${color dark blue}${upspeedgraph eth0}${color dark purple}
wlan0: $alignr ${color dark purple} ${addrs wlan0} ${color white}
${color purple}Inbound: $alignr ${downspeed wlan0} kb/s
${color dark purple}${downspeedgraph wlan0}
${color purple}Outbound: $alignr ${upspeed wlan0} kb/s
${color dark purple}${upspeedgraph wlan0}${color red}
bnep0: $alignr ${color red} ${addrs bnep0}
${color red}Inbound: $alignr ${downspeed bnep0} kb/s
${color pink}${downspeedgraph benp0}
${color red}Outbound: $alignr ${upspeed bnep0} kb/s
${color pink}${upspeedgraph bnep0}
ppp0: $alignr ${color orange} ${addrs ppp0}
${color orange}Inbound: $alignr ${downspeed ppp0} kb/s
${color yellow}${downspeedgraph ppp0}
${color orange}Outbound: $alignr ${upspeed ppp0} kb/s
${color yellow}${upspeedgraph ppp0}
${color green}---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
' > config/includes.chroot/etc/skel/.conkyrc

mkdir -p config/includes.chroot/etc/skel/.gnupg
echo "# Options for GnuPG
# Copyright 1998, 1999, 2000, 2001, 2002, 2003,
#           2010 Free Software Foundation, Inc.
# 
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
# 
# This file is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# Unless you specify which option file to use (with the command line
# option \"--options filename\"), GnuPG uses the file ~/.gnupg/gpg.conf
# by default.
#
# An options file can contain any long options which are available in
# GnuPG. If the first non white space character of a line is a '#',
# this line is ignored.  Empty lines are also ignored.
#
# See the man page for a list of options.

# Uncomment the following option to get rid of the copyright notice

#no-greeting

# If you have more than 1 secret key in your keyring, you may want to
# uncomment the following option and set your preferred keyid.

#default-key 621CC013

# If you do not pass a recipient to gpg, it will ask for one.  Using
# this option you can encrypt to a default key.  Key validation will
# not be done in this case.  The second form uses the default key as
# default recipient.

#default-recipient some-user-id
#default-recipient-self

# Use --encrypt-to to add the specified key as a recipient to all
# messages.  This is useful, for example, when sending mail through a
# mail client that does not automatically encrypt mail to your key.
# In the example, this option allows you to read your local copy of
# encrypted mail that you've sent to others.

#encrypt-to some-key-id

# By default GnuPG creates version 4 signatures for data files as
# specified by OpenPGP.  Some earlier (PGP 6, PGP 7) versions of PGP
# require the older version 3 signatures.  Setting this option forces
# GnuPG to create version 3 signatures.

#force-v3-sigs

# Because some mailers change lines starting with \"From \" to \">From \"
# it is good to handle such lines in a special way when creating
# cleartext signatures; all other PGP versions do it this way too.

#no-escape-from-lines

# If you do not use the Latin-1 (ISO-8859-1) charset, you should tell
# GnuPG which is the native character set.  Please check the man page
# for supported character sets.  This character set is only used for
# metadata and not for the actual message which does not undergo any
# translation.  Note that future version of GnuPG will change to UTF-8
# as default character set.  In most cases this option is not required
# as GnuPG is able to figure out the correct charset at runtime.

#charset utf-8

# Group names may be defined like this:
#   group mynames = paige 0x12345678 joe patti
#
# Any time \"mynames\" is a recipient (-r or --recipient), it will be
# expanded to the names \"paige\", \"joe\", and \"patti\", and the key ID
# \"0x12345678\".  Note there is only one level of expansion - you
# cannot make an group that points to another group.  Note also that
# if there are spaces in the recipient name, this will appear as two
# recipients.  In these cases it is better to use the key ID.

#group mynames = paige 0x12345678 joe patti

# Lock the file only once for the lifetime of a process.  If you do
# not define this, the lock will be obtained and released every time
# it is needed, which is usually preferable.

#lock-once

# GnuPG can send and receive keys to and from a keyserver.  These
# servers can be HKP, email, or LDAP (if GnuPG is built with LDAP
# support).
#
# Example HKP keyserver:
#      hkp://keys.gnupg.net
#      hkp://subkeys.pgp.net
#
# Example email keyserver:
#      mailto:pgp-public-keys@keys.pgp.net
#
# Example LDAP keyservers:
#      ldap://keyserver.pgp.com
#
# Regular URL syntax applies, and you can set an alternate port
# through the usual method:
#      hkp://keyserver.example.net:22742
#
# Most users just set the name and type of their preferred keyserver.
# Note that most servers (with the notable exception of
# ldap://keyserver.pgp.com) synchronize changes with each other.  Note
# also that a single server name may actually point to multiple
# servers via DNS round-robin.  hkp://keys.gnupg.net is an example of
# such a \"server\", which spreads the load over a number of physical
# servers.  To see the IP address of the server actually used, you may use
# the \"--keyserver-options debug\".

#keyserver hkp://keys.gnupg.net
#keyserver mailto:pgp-public-keys@keys.nl.pgp.net
#keyserver ldap://keyserver.pgp.com

keyserver hkps://hkps.pool.sks-keyservers.net
keyserver-options ca-cert-file=/usr/local/share/ca-certificates/sks-keyservers.pem
keyserver-options no-honor-keyserver-url

# Common options for keyserver functions:
#
# include-disabled : when searching, include keys marked as \"disabled\"
#                    on the keyserver (not all keyservers support this).
#
# no-include-revoked : when searching, do not include keys marked as
#                      \"revoked\" on the keyserver.
#
# verbose : show more information as the keys are fetched.
#           Can be used more than once to increase the amount
#           of information shown.
#
# use-temp-files : use temporary files instead of a pipe to talk to the
#                  keyserver.  Some platforms (Win32 for one) always
#                  have this on.
#
# keep-temp-files : do not delete temporary files after using them
#                   (really only useful for debugging)
#
# http-proxy=\"proxy\" : set the proxy to use for HTTP and HKP keyservers.
#                      This overrides the \"http_proxy\" environment variable,
#                      if any.
#
# auto-key-retrieve : automatically fetch keys as needed from the keyserver
#                     when verifying signatures or when importing keys that
#                     have been revoked by a revocation key that is not
#                     present on the keyring.
#
# no-include-attributes : do not include attribute IDs (aka \"photo IDs\")
#                         when sending keys to the keyserver.

#keyserver-options auto-key-retrieve

# Display photo user IDs in key listings

# Display photo user IDs when a signature from a key with a photo is
# verified

# verify-options show-photos

# Use this program to display photo user IDs
#
# %i is expanded to a temporary file that contains the photo.
# %I is the same as %i, but the file isn't deleted afterwards by GnuPG.
# %k is expanded to the key ID of the key.
# %K is expanded to the long OpenPGP key ID of the key.
# %t is expanded to the extension of the image (e.g. \"jpg\").
# %T is expanded to the MIME type of the image (e.g. \"image/jpeg\").
# %f is expanded to the fingerprint of the key.
# %% is %, of course.
#
# If %i or %I are not present, then the photo is supplied to the
# viewer on standard input.  If your platform supports it, standard
# input is the best way to do this as it avoids the time and effort in
# generating and then cleaning up a secure temp file.
#
# If no photo-viewer is provided, GnuPG will look for xloadimage, eog,
# or display (ImageMagick).  On Mac OS X and Windows, the default is
# to use your regular JPEG image viewer.
#
# Some other viewers:
# photo-viewer \"qiv %i\"
# photo-viewer \"ee %i\"
#
# This one saves a copy of the photo ID in your home directory:
# photo-viewer \"cat > ~/photoid-for-key-%k.%t\"
#
# Use your MIME handler to view photos:
# photo-viewer \"metamail -q -d -b -c %T -s 'KeyID 0x%k' -f GnuPG\"

# Passphrase agent
#
# We support the old experimental passphrase agent protocol as well as
# the new Assuan based one (currently available in the \"newpg\" package
# at ftp.gnupg.org/gcrypt/alpha/aegypten/).  To make use of the agent,
# you have to run an agent as daemon and use the option
#
use-agent
# 
# which tries to use the agent but will fallback to the regular mode
# if there is a problem connecting to the agent.  The normal way to
# locate the agent is by looking at the environment variable
# GPG_AGENT_INFO which should have been set during gpg-agent startup.
# In certain situations the use of this variable is not possible, thus
# the option
# 
# --gpg-agent-info=<path>:<pid>:1
#
# may be used to override it.

# Automatic key location
#
# GnuPG can automatically locate and retrieve keys as needed using the
# auto-key-locate option.  This happens when encrypting to an email
# address (in the \"user@example.com\" form), and there are no
# user@example.com keys on the local keyring.  This option takes the
# following arguments, in the order they are to be tried:
# 
# cert = locate a key using DNS CERT, as specified in RFC-4398.
#        GnuPG can handle both the PGP (key) and IPGP (URL + fingerprint)
#        CERT methods.
#
# pka = locate a key using DNS PKA.
#
# ldap = locate a key using the PGP Universal method of checking
#        \"ldap://keys.(thedomain)\".  For example, encrypting to
#        user@example.com will check ldap://keys.example.com.
#
# keyserver = locate a key using whatever keyserver is defined using
#             the keyserver option.
#
# You may also list arbitrary keyservers here by URL.
#
# Try CERT, then PKA, then LDAP, then hkp://subkeys.net:
#auto-key-locate cert pka ldap hkp://subkeys.pgp.net
 
fixed-list-mode
keyid-format 0xlong
fingerprint
personal-digest-preferences SHA512 SHA384 SHA256 SHA224
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 BZIP2 ZLIB ZIP Uncompressed
cert-digest-algo SHA512
verify-options show-uid-validity
list-options show-uid-validity
" > config/includes.chroot/etc/skel/.gnupg/gnupg.conf

echo "# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n \"$BASH_VERSION\" ]; then
    # include .bashrc if it exists
    if [ -f \"$HOME/.bashrc\" ]; then
	. \"$HOME/.bashrc\"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d \"$HOME/bin\" ] ; then
    export PATH=\"$HOME/bin:$PATH\"
fi
" > config/includes.chroot/etc/skel/.profile

mkdir -p config/includes.chroot/etc/skel/bin
dbd033='\\\\033'
echo "#
# You should have received a copy of the GNU General Public License
# along with backbox-anonymous. If not, see .

export BLUE='$dbd033[1;94m'
export GREEN='$dbd033[1;92m'
export RED='$dbd033[1;91m'
export ENDC='$dbd033[1;00m'

# Destinations you don't want routed through Tor
NON_TOR=\"192.168.0.0/16 172.16.0.0/12 10.0.0.0/8\"

# The GID Tor runs as
TOR_GID=\"debian-tor\"

# Tor's TransPort
TRANS_PORT=\"9040\"

case \"\$1\" in
    start)
        # Make sure only root can run this script
        if [ \$(id -u) -ne 0 ]; then
          echo \"\\n\$RED[!] This script must be run as root\$ENDC\\n\" >&2
          exit 1
        fi
        
        # Check torrc config file
        grep -q -x 'VirtualAddrNetwork 10.192.0.0/10' /etc/tor/torrc
        if [ \$? -ne 0 ]; then
            echo \"\\n\$RED[!] Please add the following to your /etc/tor/torrc and restart service:\$ENDC\\n\" >&2
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\"
            echo \"VirtualAddrNetwork 10.192.0.0/10\"
            echo \"AutomapHostsOnResolve 1\"
            echo \"TransPort 9040\"
            echo \"DNSPort 53\"
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\\n\"
            exit 1
        fi
        grep -q -x 'AutomapHostsOnResolve 1' /etc/tor/torrc
        if [ \$? -ne 0 ]; then
            echo \"\\n\$RED[!] Please add the following to your /etc/tor/torrc and restart service:\$ENDC\\n\" >&2
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\"
            echo \"VirtualAddrNetwork 10.192.0.0/10\"
            echo \"AutomapHostsOnResolve 1\"
            echo \"TransPort 9040\"
            echo \"DNSPort 53\"
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\\n\"
            exit 1
        fi
        grep -q -x 'TransPort 9040' /etc/tor/torrc
        if [ \$? -ne 0 ]; then
            echo \"\\n\$RED[!] Please add the following to your /etc/tor/torrc and restart service:\$ENDC\\n\" >&2
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\"
            echo \"VirtualAddrNetwork 10.192.0.0/10\"
            echo \"AutomapHostsOnResolve 1\"
            echo \"TransPort 9040\"
            echo \"DNSPort 53\"
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\\n\"
            exit 1
        fi
        grep -q -x 'DNSPort 53' /etc/tor/torrc
        if [ \$? -ne 0 ]; then
            echo \"\\n\$RED[!] Please add the following to your /etc/tor/torrc and restart service:\$ENDC\\n\" >&2
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\"
            echo \"VirtualAddrNetwork 10.192.0.0/10\"
            echo \"AutomapHostsOnResolve 1\"
            echo \"TransPort 9040\"
            echo \"DNSPort 53\"
            echo \"\$BLUE#----------------------------------------------------------------------#\$ENDC\\n\"
            exit 1
        fi

        echo \"\\n\$BLUE[i] Starting anonymous mode:\$ENDC\\n\"
        
        if [ ! -e /var/run/tor/tor.pid ]; then
            echo \" \$RED*\$ENDC Tor is not running! Quitting...\\n\" >&2
            exit 1
        fi
        
        iptables -F
        iptables -t nat -F
        echo \" \$GREEN*\$ENDC Deleted all iptables rules\"

        echo 'nameserver 127.0.0.1' > /etc/resolv.conf
        echo \" \$GREEN*\$ENDC Modified resolv.conf to use Tor\"

        iptables -t nat -A OUTPUT -m owner --gid-owner \$TOR_GID -j RETURN
        iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53
        for NET in \$NON_TOR 127.0.0.0/9 127.128.0.0/10; do
            iptables -t nat -A OUTPUT -d \$NET -j RETURN
        done
        iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports \$TRANS_PORT
        iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        for NET in \$NON_TOR 127.0.0.0/8; do
                iptables -A OUTPUT -d \$NET -j ACCEPT
        done
        iptables -A OUTPUT -m owner --gid-owner \$TOR_GID -j ACCEPT
        iptables -A OUTPUT -j REJECT
        echo \"\$GREEN *\$ENDC Redirected all traffic throught Tor\\n\"

        echo \"\$BLUE[i] Are you using Tor?\$ENDC\\n\"
        echo \"\$GREEN *\$ENDC Please refer to https://check.torproject.org\\n\"
    ;;
    stop)
        # Make sure only root can run our script
        if [ \$(id -u) -ne 0 ]; then
          echo \"\\n\$RED[!] This script must be run as root\$ENDC\\n\" >&2
          exit 1
        fi
        
        echo \"\\n\$BLUE[i] Stopping anonymous mode:\$ENDC\\n\"

        echo 'nameserver 208.67.222.222' >  /etc/resolv.conf
        echo 'nameserver 208.67.220.220' >> /etc/resolv.conf
        echo \" \$GREEN*\$ENDC Modified resolv.conf to use OpenDNS\"
        
        iptables -F
        iptables -t nat -F
        echo \" \$GREEN*\$ENDC Deleted all iptables rules\\n\"
	sudo service ferm restart
        echo \" \$GREEN*\$ENDC Restarted system firewall\\n\"
    ;;
    restart)
        \$0 stop
        \$0 start
    ;;
    *)
    echo \"Usage: \$0 {start|stop|restart}\"
    exit 1
    ;;
esac

exit 0" > config/includes.chroot/etc/skel/bin/.bb-anon.sh
chmod a+x config/includes.chroot/etc/skel/bin/.bb-anon.sh
echo "#! /bin/sh
bb-anon.sh \$1
" > config/includes.chroot/etc/skel/bin/bb-anon
chmod a+x config/includes.chroot/etc/skel/bin/bb-anon

mkdir -p config/includes.chroot/etc/skel/.purple
echo "<?xml version='1.0' encoding='UTF-8' ?>

<pref version='1' name='/'>
	<pref name='purple'>
		<pref name='away'>
			<pref name='idle_reporting' type='string' value='system'/>
			<pref name='away_when_idle' type='bool' value='1'/>
			<pref name='mins_before_away' type='int' value='5'/>
			<pref name='auto_reply' type='string' value='awayidle'/>
		</pref>
		<pref name='buddies'/>
		<pref name='contact'>
			<pref name='last_match' type='bool' value='0'/>
		</pref>
		<pref name='logging'>
			<pref name='log_ims' type='bool' value='0'/>
			<pref name='log_chats' type='bool' value='0'/>
			<pref name='log_system' type='bool' value='0'/>
			<pref name='format' type='string' value='html'/>
		</pref>
		<pref name='debug'>
			<pref name='timestamps' type='bool' value='1'/>
		</pref>
		<pref name='media'>
			<pref name='audio'>
				<pref name='silence_threshold' type='int' value='5'/>
				<pref name='volume'>
					<pref name='input' type='int' value='10'/>
					<pref name='output' type='int' value='10'/>
				</pref>
			</pref>
		</pref>
		<pref name='status'>
			<pref name='scores'>
				<pref name='offline' type='int' value='-500'/>
				<pref name='available' type='int' value='100'/>
				<pref name='invisible' type='int' value='-50'/>
				<pref name='away' type='int' value='-100'/>
				<pref name='extended_away' type='int' value='-200'/>
				<pref name='idle' type='int' value='0'/>
				<pref name='offline_msg' type='int' value='-5'/>
			</pref>
		</pref>
		<pref name='savedstatus'>
			<pref name='default' type='int' value='1354982410'/>
			<pref name='startup' type='int' value='0'/>
			<pref name='startup_current_status' type='bool' value='1'/>
			<pref name='idleaway' type='int' value='1354982581'/>
			<pref name='isidleaway' type='bool' value='0'/>
		</pref>
		<pref name='conversations'>
			<pref name='chat'>
				<pref name='show_nick_change' type='bool' value='1'/>
			</pref>
			<pref name='im'>
				<pref name='send_typing' type='bool' value='1'/>
			</pref>
		</pref>
		<pref name='network'>
			<pref name='stun_server' type='string' value=''/>
			<pref name='turn_server' type='string' value=''/>
			<pref name='turn_port' type='int' value='3478'/>
			<pref name='turn_port_tcp' type='int' value='3478'/>
			<pref name='turn_username' type='string' value=''/>
			<pref name='turn_password' type='string' value=''/>
			<pref name='auto_ip' type='bool' value='1'/>
			<pref name='public_ip' type='string' value=''/>
			<pref name='map_ports' type='bool' value='1'/>
			<pref name='ports_range_use' type='bool' value='0'/>
			<pref name='ports_range_start' type='int' value='1024'/>
			<pref name='ports_range_end' type='int' value='2048'/>
		</pref>
		<pref name='proxy'>
			<pref name='type' type='string' value='socks5'/>
			<pref name='host' type='string' value='localhost'/>
			<pref name='port' type='int' value='9050'/>
			<pref name='username' type='string' value=''/>
			<pref name='password' type='string' value=''/>
			<pref name='socks4_remotedns' type='bool' value='0'/>
		</pref>
		<pref name='sound'>
			<pref name='while_status' type='int' value='1'/>
		</pref>
	</pref>
	<pref name='plugins'>
		<pref name='core'>
			<pref name='core-plugin_pack-autoaccept'>
				<pref name='path' type='string' value='/home/paranoid/.purple/autoaccept'/>
				<pref name='notify' type='bool' value='1'/>
				<pref name='newdir' type='bool' value='1'/>
				<pref name='escape' type='bool' value='1'/>
			</pref>
			<pref name='joinpart'>
				<pref name='delay' type='int' value='10'/>
				<pref name='threshold' type='int' value='20'/>
				<pref name='hide_buddies' type='bool' value='0'/>
			</pref>
			<pref name='newline'>
				<pref name='im' type='bool' value='1'/>
				<pref name='chat' type='bool' value='1'/>
			</pref>
			<pref name='core-plugin_pack-offlinemsg'>
				<pref name='always' type='bool' value='0'/>
			</pref>
			<pref name='psychic'>
				<pref name='buddies_only' type='bool' value='0'/>
				<pref name='show_notice' type='bool' value='1'/>
				<pref name='activate_online' type='bool' value='1'/>
			</pref>
			<pref name='statenotify'>
				<pref name='notify_away' type='bool' value='1'/>
				<pref name='notify_idle' type='bool' value='1'/>
				<pref name='notify_signon' type='bool' value='1'/>
			</pref>
			<pref name='twitgin'>
				<pref name='reply_link' type='bool' value='1'/>
				<pref name='fav_link' type='bool' value='1'/>
				<pref name='rt_link' type='bool' value='1'/>
				<pref name='ms_link' type='bool' value='1'/>
				<pref name='avatar_size' type='int' value='24'/>
			</pref>
		</pref>
		<pref name='lopl'/>
		<pref name='prpl'>
			<pref name='oscar'>
				<pref name='recent_buddies' type='bool' value='0'/>
			</pref>
			<pref name='meanwhile'>
				<pref name='blist_action' type='int' value='4'/>
			</pref>
		</pref>
		<pref name='gtk'>
			<pref name='X11'>
				<pref name='notify'>
					<pref name='type_im' type='bool' value='1'/>
					<pref name='type_chat' type='bool' value='0'/>
					<pref name='type_focused' type='bool' value='0'/>
					<pref name='method_string' type='bool' value='0'/>
					<pref name='title_string' type='string' value='(*)'/>
					<pref name='method_urgent' type='bool' value='1'/>
					<pref name='method_count' type='bool' value='0'/>
					<pref name='notify_focus' type='bool' value='1'/>
					<pref name='notify_click' type='bool' value='1'/>
					<pref name='notify_type' type='bool' value='1'/>
					<pref name='notify_send' type='bool' value='1'/>
					<pref name='notify_switch' type='bool' value='1'/>
					<pref name='type_chat_nick' type='bool' value='0'/>
					<pref name='method_count_xprop' type='bool' value='0'/>
					<pref name='method_raise' type='bool' value='0'/>
					<pref name='method_present' type='bool' value='0'/>
				</pref>
				<pref name='gestures'>
					<pref name='visual' type='bool' value='0'/>
				</pref>
			</pref>
			<pref name='cap'>
				<pref name='max_seen_difference' type='int' value='1'/>
				<pref name='max_msg_difference' type='int' value='10'/>
				<pref name='threshold' type='int' value='5'/>
			</pref>
			<pref name='gtk-plugin_pack-convcolors'>
				<pref name='ignore_incoming' type='bool' value='1'/>
				<pref name='chats' type='bool' value='1'/>
				<pref name='ims' type='bool' value='1'/>
				<pref name='send'>
					<pref name='color' type='string' value='#909090'/>
					<pref name='format' type='int' value='0'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='recv'>
					<pref name='color' type='string' value='#000000'/>
					<pref name='format' type='int' value='0'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='system'>
					<pref name='color' type='string' value='#50a050'/>
					<pref name='format' type='int' value='2'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='error'>
					<pref name='color' type='string' value='#ff0000'/>
					<pref name='format' type='int' value='5'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='nick'>
					<pref name='color' type='string' value='#0000dd'/>
					<pref name='format' type='int' value='1'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
			</pref>
			<pref name='extplacement'>
				<pref name='placement_number' type='int' value='4'/>
				<pref name='placement_number_separate' type='bool' value='0'/>
			</pref>
			<pref name='gtk-plugin_pack-markerline'>
				<pref name='ims' type='bool' value='0'/>
				<pref name='chats' type='bool' value='1'/>
			</pref>
			<pref name='musicmessaging'>
				<pref name='editor_path' type='string' value='/usr/bin/gscore'/>
			</pref>
			<pref name='purplerc'>
				<pref name='set'>
					<pref name='gtk-font-name' type='bool' value='0'/>
					<pref name='gtk-key-theme-name' type='bool' value='0'/>
					<pref name='color'>
						<pref name='GtkIMHtml::hyperlink-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::hyperlink-visited-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::send-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::receive-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::highlight-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::action-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::typing-notification-color' type='bool' value='0'/>
					</pref>
					<pref name='size'>
						<pref name='GtkTreeView::horizontal_separator' type='bool' value='0'/>
					</pref>
					<pref name='font'>
						<pref name='*pidgin_conv_entry' type='bool' value='0'/>
						<pref name='*pidgin_conv_imhtml' type='bool' value='0'/>
						<pref name='*pidgin_request_imhtml' type='bool' value='0'/>
						<pref name='*pidgin_notify_imhtml' type='bool' value='0'/>
					</pref>
					<pref name='disable-typing-notification' type='bool' value='0'/>
				</pref>
				<pref name='gtk-font-name' type='string' value=''/>
				<pref name='gtk-key-theme-name' type='string' value=''/>
				<pref name='color'>
					<pref name='GtkIMHtml::hyperlink-color' type='string' value=''/>
					<pref name='GtkIMHtml::hyperlink-visited-color' type='string' value=''/>
					<pref name='GtkIMHtml::send-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::receive-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::highlight-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::action-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::typing-notification-color' type='string' value=''/>
				</pref>
				<pref name='size'>
					<pref name='GtkTreeView::horizontal_separator' type='int' value='0'/>
				</pref>
				<pref name='font'>
					<pref name='*pidgin_conv_entry' type='string' value=''/>
					<pref name='*pidgin_conv_imhtml' type='string' value=''/>
					<pref name='*pidgin_request_imhtml' type='string' value=''/>
					<pref name='*pidgin_notify_imhtml' type='string' value=''/>
				</pref>
				<pref name='disable-typing-notification' type='bool' value='0'/>
			</pref>
			<pref name='timestamp'>
				<pref name='interval' type='int' value='300000'/>
			</pref>
			<pref name='timestamp_format'>
				<pref name='force' type='string' value='default'/>
				<pref name='use_dates'>
					<pref name='conversation' type='string' value='automatic'/>
					<pref name='log' type='string' value='automatic'/>
				</pref>
			</pref>
			<pref name='libnotify'>
				<pref name='blocked_nicks' type='stringlist'>
					<item value='NickServ'/>
					<item value='ChanServ'/>
					<item value='MsgServ'/>
					<item value='freenode-connect'/>
				</pref>
				<pref name='newmsg' type='bool' value='1'/>
				<pref name='blocked' type='bool' value='1'/>
				<pref name='newconvonly' type='bool' value='0'/>
				<pref name='signon' type='bool' value='1'/>
				<pref name='signoff' type='bool' value='0'/>
				<pref name='only_available' type='bool' value='0'/>
				<pref name='auto_loaded' type='bool' value='1'/>
			</pref>
		</pref>
	</pref>
	<pref name='pidgin'>
		<pref name='browsers'>
			<pref name='browser' type='string' value='custom'/>
			<pref name='place' type='int' value='0'/>
			<pref name='manual_command' type='string' value='sensible-browser'/>
		</pref>
		<pref name='plugins'>
			<pref name='loaded' type='pathlist'>
				<item value='/usr/lib/purple-2/pidgin-libnotify.so'/>
				<item value='/usr/lib/purple-2/ssl-nss.so'/>
				<item value='/usr/lib/pidgin/pidgin-otr.so'/>
				<item value='/usr/lib/purple-2/ssl.so'/>
			</pref>
		</pref>
		<pref name='filelocations'>
			<pref name='last_save_folder' type='path' value='/home/paranoid/Scrivania'/>
			<pref name='last_open_folder' type='path' value='/home/paranoid'/>
			<pref name='last_icon_folder' type='path' value=''/>
		</pref>
		<pref name='smileys'>
			<pref name='theme' type='string' value='Default'/>
		</pref>
		<pref name='debug'>
			<pref name='enabled' type='bool' value='0'/>
			<pref name='filterlevel' type='int' value='0'/>
			<pref name='style' type='int' value='3'/>
			<pref name='toolbar' type='bool' value='1'/>
			<pref name='width' type='int' value='450'/>
			<pref name='height' type='int' value='250'/>
			<pref name='regex' type='string' value=''/>
			<pref name='filter' type='bool' value='0'/>
			<pref name='invert' type='bool' value='0'/>
			<pref name='case_insensitive' type='bool' value='0'/>
			<pref name='highlight' type='bool' value='0'/>
		</pref>
		<pref name='status'>
			<pref name='icon-theme' type='string' value=''/>
			<pref name='icon-theme-dir' type='path' value=''/>
			<pref name='dialog'>
				<pref name='width' type='int' value='550'/>
				<pref name='height' type='int' value='250'/>
			</pref>
		</pref>
		<pref name='stock'>
			<pref name='icon-theme' type='string' value=''/>
			<pref name='icon-theme-dir' type='path' value=''/>
		</pref>
		<pref name='sound'>
			<pref name='enabled'>
				<pref name='login' type='bool' value='1'/>
				<pref name='logout' type='bool' value='1'/>
				<pref name='im_recv' type='bool' value='1'/>
				<pref name='first_im_recv' type='bool' value='0'/>
				<pref name='send_im' type='bool' value='1'/>
				<pref name='join_chat' type='bool' value='0'/>
				<pref name='left_chat' type='bool' value='0'/>
				<pref name='send_chat_msg' type='bool' value='0'/>
				<pref name='chat_msg_recv' type='bool' value='0'/>
				<pref name='nick_said' type='bool' value='0'/>
				<pref name='pounce_default' type='bool' value='1'/>
				<pref name='sent_attention' type='bool' value='1'/>
				<pref name='got_attention' type='bool' value='1'/>
			</pref>
			<pref name='file'>
				<pref name='login' type='path' value=''/>
				<pref name='logout' type='path' value=''/>
				<pref name='im_recv' type='path' value=''/>
				<pref name='first_im_recv' type='path' value=''/>
				<pref name='send_im' type='path' value=''/>
				<pref name='join_chat' type='path' value=''/>
				<pref name='left_chat' type='path' value=''/>
				<pref name='send_chat_msg' type='path' value=''/>
				<pref name='chat_msg_recv' type='path' value=''/>
				<pref name='nick_said' type='path' value=''/>
				<pref name='pounce_default' type='path' value=''/>
				<pref name='sent_attention' type='path' value=''/>
				<pref name='got_attention' type='path' value=''/>
			</pref>
			<pref name='theme' type='string' value=''/>
			<pref name='conv_focus' type='bool' value='1'/>
			<pref name='mute' type='bool' value='0'/>
			<pref name='command' type='path' value=''/>
			<pref name='method' type='string' value='automatic'/>
			<pref name='volume' type='int' value='50'/>
		</pref>
		<pref name='accounts'>
			<pref name='dialog'>
				<pref name='width' type='int' value='520'/>
				<pref name='height' type='int' value='321'/>
			</pref>
			<pref name='buddyicon' type='path' value=''/>
		</pref>
		<pref name='blist'>
			<pref name='show_buddy_icons' type='bool' value='1'/>
			<pref name='show_empty_groups' type='bool' value='0'/>
			<pref name='show_idle_time' type='bool' value='1'/>
			<pref name='show_offline_buddies' type='bool' value='0'/>
			<pref name='show_protocol_icons' type='bool' value='0'/>
			<pref name='list_visible' type='bool' value='1'/>
			<pref name='list_maximized' type='bool' value='0'/>
			<pref name='sort_type' type='string' value='alphabetical'/>
			<pref name='x' type='int' value='484'/>
			<pref name='y' type='int' value='108'/>
			<pref name='width' type='int' value='250'/>
			<pref name='height' type='int' value='405'/>
			<pref name='theme' type='string' value=''/>
		</pref>
		<pref name='conversations'>
			<pref name='use_smooth_scrolling' type='bool' value='1'/>
			<pref name='close_on_tabs' type='bool' value='1'/>
			<pref name='send_bold' type='bool' value='0'/>
			<pref name='send_italic' type='bool' value='0'/>
			<pref name='send_underline' type='bool' value='0'/>
			<pref name='spellcheck' type='bool' value='1'/>
			<pref name='show_incoming_formatting' type='bool' value='1'/>
			<pref name='resize_custom_smileys' type='bool' value='1'/>
			<pref name='custom_smileys_size' type='int' value='96'/>
			<pref name='minimum_entry_lines' type='int' value='2'/>
			<pref name='show_timestamps' type='bool' value='1'/>
			<pref name='show_formatting_toolbar' type='bool' value='1'/>
			<pref name='placement' type='string' value='last'/>
			<pref name='placement_number' type='int' value='1'/>
			<pref name='bgcolor' type='string' value=''/>
			<pref name='fgcolor' type='string' value=''/>
			<pref name='font_face' type='string' value=''/>
			<pref name='font_size' type='int' value='3'/>
			<pref name='tabs' type='bool' value='1'/>
			<pref name='tab_side' type='int' value='2'/>
			<pref name='scrollback_lines' type='int' value='4000'/>
			<pref name='chat'>
				<pref name='entry_height' type='int' value='54'/>
				<pref name='userlist_width' type='int' value='80'/>
				<pref name='x' type='int' value='0'/>
				<pref name='y' type='int' value='0'/>
				<pref name='width' type='int' value='340'/>
				<pref name='height' type='int' value='390'/>
			</pref>
			<pref name='im'>
				<pref name='x' type='int' value='0'/>
				<pref name='y' type='int' value='0'/>
				<pref name='width' type='int' value='340'/>
				<pref name='height' type='int' value='390'/>
				<pref name='animate_buddy_icons' type='bool' value='1'/>
				<pref name='entry_height' type='int' value='54'/>
				<pref name='show_buddy_icons' type='bool' value='1'/>
				<pref name='hide_new' type='string' value='never'/>
				<pref name='close_immediately' type='bool' value='1'/>
			</pref>
			<pref name='toolbar'>
				<pref name='wide' type='bool' value='0'/>
			</pref>
		</pref>
		<pref name='pounces'>
			<pref name='default_actions'>
				<pref name='open-window' type='bool' value='0'/>
				<pref name='popup-notify' type='bool' value='1'/>
				<pref name='send-message' type='bool' value='0'/>
				<pref name='execute-command' type='bool' value='0'/>
				<pref name='play-sound' type='bool' value='0'/>
			</pref>
			<pref name='dialog'>
				<pref name='width' type='int' value='520'/>
				<pref name='height' type='int' value='321'/>
			</pref>
		</pref>
		<pref name='filetransfer'>
			<pref name='clear_finished' type='bool' value='1'/>
			<pref name='keep_open' type='bool' value='0'/>
		</pref>
		<pref name='docklet'>
			<pref name='blink' type='bool' value='0'/>
			<pref name='show' type='string' value='always'/>
			<pref name='gtk'>
				<pref name='embedded' type='bool' value='1'/>
			</pref>
		</pref>
	</pref>
	<pref name='OTR'>
		<pref name='enabled' type='bool' value='1'/>
		<pref name='automatic' type='bool' value='1'/>
		<pref name='onlyprivate' type='bool' value='0'/>
		<pref name='avoidloggingotr' type='bool' value='0'/>
	</pref>
</pref>
" > config/includes.chroot/etc/skel/.purple/prefs.xml

mkdir -p config/includes.chroot/etc/skel/.filezilla/
echo '<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<FileZilla3>
    <Settings>
        <Setting name="Use Pasv mode">1</Setting>
        <Setting name="Limit local ports">0</Setting>
        <Setting name="Limit ports low">6000</Setting>
        <Setting name="Limit ports high">7000</Setting>
        <Setting name="External IP mode">0</Setting>
        <Setting name="External IP"></Setting>
        <Setting name="External address resolver">http://ip.filezilla-project.org/ip.php</Setting>
        <Setting name="Last resolved IP"></Setting>
        <Setting name="No external ip on local conn">1</Setting>
        <Setting name="Pasv reply fallback mode">0</Setting>
        <Setting name="Timeout">20</Setting>
        <Setting name="Logging Debug Level">0</Setting>
        <Setting name="Logging Raw Listing">0</Setting>
        <Setting name="fzsftp executable"></Setting>
        <Setting name="Allow transfermode fallback">1</Setting>
        <Setting name="Reconnect count">2</Setting>
        <Setting name="Reconnect delay">5</Setting>
        <Setting name="Enable speed limits">0</Setting>
        <Setting name="Speedlimit inbound">100</Setting>
        <Setting name="Speedlimit outbound">20</Setting>
        <Setting name="Speedlimit burst tolerance">0</Setting>
        <Setting name="View hidden files">0</Setting>
        <Setting name="Preserve timestamps">0</Setting>
        <Setting name="Socket recv buffer size (v2)">4194304</Setting>
        <Setting name="Socket send buffer size (v2)">262144</Setting>
        <Setting name="FTP Keep-alive commands">0</Setting>
        <Setting name="FTP Proxy type">0</Setting>
        <Setting name="FTP Proxy host"></Setting>
        <Setting name="FTP Proxy user"></Setting>
        <Setting name="FTP Proxy password"></Setting>
        <Setting name="FTP Proxy login sequence"></Setting>
        <Setting name="SFTP keyfiles"></Setting>
        <Setting name="Proxy type">2</Setting>
        <Setting name="Proxy host">127.0.0.1</Setting>
        <Setting name="Proxy port">9050</Setting>
        <Setting name="Proxy user"></Setting>
        <Setting name="Proxy password"></Setting>
        <Setting name="Logging file"></Setting>
        <Setting name="Logging filesize limit">10</Setting>
        <Setting name="Trusted root certificate"></Setting>
        <Setting name="Size format">0</Setting>
        <Setting name="Size thousands separator">1</Setting>
        <Setting name="Size decimal places">1</Setting>
        <Setting name="Number of Transfers">2</Setting>
        <Setting name="Ascii Binary mode">0</Setting>
        <Setting name="Auto Ascii files">am|asp|bat|c|cfm|cgi|conf|cpp|css|dhtml|diz|h|hpp|htm|html|in|inc|java|js|jsp|lua|m4|mak|md5|nfo|nsi|pas|patch|php|phtml|pl|po|py|qmail|sh|shtml|sql|svg|tcl|tpl|txt|vbs|xhtml|xml|xrc</Setting>
        <Setting name="Auto Ascii no extension">1</Setting>
        <Setting name="Auto Ascii dotfiles">1</Setting>
        <Setting name="Theme">opencrystal/</Setting>
        <Setting name="Language Code"></Setting>
        <Setting name="Last Server Path"></Setting>
        <Setting name="Concurrent download limit">0</Setting>
        <Setting name="Concurrent upload limit">0</Setting>
        <Setting name="Update Check">1</Setting>
        <Setting name="Update Check Interval">7</Setting>
        <Setting name="Last automatic update check"></Setting>
        <Setting name="Update Check New Version"></Setting>
        <Setting name="Update Check Check Beta">0</Setting>
        <Setting name="Update Check Download Dir"></Setting>
        <Setting name="Show debug menu">0</Setting>
        <Setting name="File exists action download">0</Setting>
        <Setting name="File exists action upload">0</Setting>
        <Setting name="Allow ascii resume">0</Setting>
        <Setting name="Greeting version">3.5.3</Setting>
        <Setting name="Onetime Dialogs"></Setting>
        <Setting name="Show Tree Local">1</Setting>
        <Setting name="Show Tree Remote">1</Setting>
        <Setting name="File Pane Layout">0</Setting>
        <Setting name="File Pane Swap">0</Setting>
        <Setting name="Last local directory">/</Setting>
        <Setting name="Filelist directory sort">0</Setting>
        <Setting name="Queue successful autoclear">0</Setting>
        <Setting name="Queue column widths">180 60 180 80 60 150</Setting>
        <Setting name="Local filelist colwidths">120 80 100 120</Setting>
        <Setting name="Remote filelist colwidths">80 75 80 100 80 80</Setting>
        <Setting name="Window position and size">1 0 24 900 474 </Setting>
        <Setting name="Splitter positions (v2)">97 -130 500000000 100 100 500000000</Setting>
        <Setting name="Local filelist sortorder">0 0</Setting>
        <Setting name="Remote filelist sortorder">0 0</Setting>
        <Setting name="Time Format">0</Setting>
        <Setting name="Date Format">0</Setting>
        <Setting name="Show message log">1</Setting>
        <Setting name="Show queue">1</Setting>
        <Setting name="Default editor">0</Setting>
        <Setting name="Always use default editor">0</Setting>
        <Setting name="Inherit system associations">1</Setting>
        <Setting name="Custom file associations"></Setting>
        <Setting name="Comparison mode">1</Setting>
        <Setting name="Comparison threshold">1</Setting>
        <Setting name="Site Manager position"></Setting>
        <Setting name="Theme icon size"></Setting>
        <Setting name="Timestamp in message log">0</Setting>
        <Setting name="Sitemanager last selected"></Setting>
        <Setting name="Local filelist shown columns">1111</Setting>
        <Setting name="Remote filelist shown columns">111111</Setting>
        <Setting name="Local filelist column order">0,1,2,3</Setting>
        <Setting name="Remote filelist column order">0,1,2,3,4,5</Setting>
        <Setting name="Filelist status bar">1</Setting>
        <Setting name="Filter toggle state">0</Setting>
        <Setting name="Show quickconnect bar">1</Setting>
        <Setting name="Messagelog position">0</Setting>
        <Setting name="Last connected site"></Setting>
        <Setting name="File doubleclock action">0</Setting>
        <Setting name="Dir doubleclock action">0</Setting>
        <Setting name="Minimize to tray">0</Setting>
        <Setting name="Search column widths"></Setting>
        <Setting name="Search column shown"></Setting>
        <Setting name="Search column order"></Setting>
        <Setting name="Search window size"></Setting>
        <Setting name="Comparison hide identical">0</Setting>
        <Setting name="Search sort order"></Setting>
        <Setting name="Edit track local">1</Setting>
        <Setting name="Prevent idle sleep">1</Setting>
        <Setting name="Filteredit window size"></Setting>
        <Setting name="Enable invalid char filter">1</Setting>
        <Setting name="Invalid char replace">_</Setting>
        <Setting name="Already connected choice">0</Setting>
        <Setting name="Edit status dialog size"></Setting>
        <Setting name="Display current speed">0</Setting>
        <Setting name="Toolbar hidden">0</Setting>
        <Setting name="Strip VMS revisions">0</Setting>
        <Setting name="Show Site Manager on startup">0</Setting>
        <Setting name="Config Location">/home/paranoid/.filezilla</Setting>
        <Setting name="Kiosk mode">0</Setting>
        <Setting name="Disable update check">0</Setting>
        <LastServer>
            <Host></Host>
            <Port>21</Port>
            <Protocol>-1</Protocol>
            <Type>0</Type>
            <Logontype>0</Logontype>
            <TimezoneOffset>0</TimezoneOffset>
            <PasvMode>MODE_DEFAULT</PasvMode>
            <MaximumMultipleConnections>0</MaximumMultipleConnections>
            <EncodingType>Auto</EncodingType>
            <BypassProxy>0</BypassProxy>
        </LastServer>
    </Settings>
</FileZilla3>
' > config/includes.chroot/etc/skel/.filezilla/filezilla.xml

echo '[http]
	proxy = http://127.0.0.1:8118
[https]
	proxy = https://127.0.0.1:8118
[merge]
	renamelimit = 15891
[user]
	name = cmotc
	email = cmotc@openmailbox.org
' > config/includes.chroot/etc/skel/.gitconfig

mkdir -p config/includes.chroot/usr/share/applications
echo '[Desktop Entry]
Name=Conky
Comment=desktop monitoring software
Exec=conkydesktop
Terminal=false
Type=Application
Categories=GNOME;GTK;
' > config/includes.chroot/usr/share/applications/conky.desktop