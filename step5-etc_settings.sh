#! /bin/sh
echo ":'
##Generating the settings
'"
mkdir -p config/includes.chroot/etc/ferm/
echo '
# ferm firewall rules
# http://ferm.foo-projects.org
domain (ip ip6){
  table filter {
    chain INPUT {
	policy DROP;
	# connection tracking
	mod state state INVALID DROP;
	mod state state (ESTABLISHED RELATED) ACCEPT;
	# allow local connections
	interface lo ACCEPT;
	# Allow Bittorrent and Bitcoind
	proto tcp dport (4433 4434 28333 29333) ACCEPT;
	proto udp dport 29333 ACCEPT;
	# (legacy) Allow peer connections to the i2p network via UDP
      # the rest is dropped by the above policy
    }
    # outgoing connections are not limited
    chain OUTPUT{
      policy DROP;
      # Tor is allowed to do anything it wants to.
      mod owner uid-owner debian-tor ACCEPT;
      # i2p is allowed to do anything it wants to.
      mod owner uid-owner i2psvc ACCEPT;
      # White-list access to Tor
      daddr 127.0.0.1 proto tcp syn dport 9050 ACCEPT;
      daddr 127.0.0.1 proto tcp syn mod multiport destination-ports (5353 9040 9050 9051 8118 9061 9062 9150 8123) ACCEPT;
      #White-list access to i2p
      daddr 127.0.0.1 proto tcp syn mod multiport destination-ports (2827 4444 4445 6668 7656 7657 7658 7659 7660 8998) ACCEPT;
      #White-list access to system DNS and Tor DNS, block all else
      daddr 127.0.0.1 proto udp dport (53 5353) ACCEPT;
      #White-list access to HTTP Proxies
      daddr 127.0.0.1 proto tcp syn dport (8118 8123) ACCEPT;
      #White-list access to BitTorrent
      proto (tcp udp) dport (6881 6882 6883 6885 6886 6887 6888 6889 28333 29333 51413) ACCEPT;
      #White-list access to CUPS
      daddr 127.0.0.1 proto tcp syn dport 631 ACCEPT;
      # White-list access to Monkeysphere
      daddr 127.0.0.1 proto tcp syn dport 6136 ACCEPT;
      # Local network connections should not go through Tor but DNS shall be
      # rejected.
      # (Note that we exclude the VirtualAddrNetwork used for .onion:s here.)
      daddr (10.0.0.0/8 172.16.0.0/12 192.168.0.0/16) @subchain "lan" {
        proto tcp dport domain REJECT;
        proto udp dport domain REJECT;
        ACCEPT;
      }
      #White-list access to for Twister
      daddr 127.0.0.1 proto (tcp udp) dport (28332) ACCEPT;
      daddr 127.0.0.1 proto (udp) dport (1900 29333 60177) ACCEPT;
      #White-list access for Tox
      daddr 127.0.0.1 proto (tcp udp) dport (55166 55167 55526 55177 55184) ACCEPT;
      #OK so I am going to make it difficult for you here. If you ABSOLUTELY
      #need to access the clearnet, uncomment the following 3 lines or compose
      #your own rules.
      #White-list access for common clearnet services
      #proto (tcp udp) dport 53 ACCEPT;
      #proto tcp dport (7 ftp http https ssh smtp whois 995 465 5222 5223 8010 5060 7078 9078) ACCEPT;
      #proto (tcp udp) dport 33434 ACCEPT;
      outerface lo{
	ACCEPT;
      }
    }
  }
}
table nat {
  chain PREROUTING {
    policy ACCEPT;
  }
  chain POSTROUTING {
    policy ACCEPT;
  }
  chain OUTPUT {
    policy ACCEPT;
    # .onion mapped addresses redirection to Tor.
    daddr 127.192.0.0/10 proto tcp REDIRECT to-ports 9040;
    # Redirect system DNS to Tor DNSport
    daddr 127.0.0.1 proto udp dport 53 REDIRECT to-ports 5353;
  }
}
# established/related connections
# domain (ip ip6) table filter chain (INPUT OUTPUT) mod state state (ESTABLISHED RELATED) ACCEPT;
domain (ip ip6) table filter chain FORWARD ACCEPT;
# log all other INPUT
domain (ip ip6) table filter chain INPUT {
    mod limit limit 3/min limit-burst 10 LOG log-prefix "INPUT-rejected: " log-level debug;
    REJECT;
}
' > config/includes.chroot/etc/ferm/ferm.conf

mkdir -p config/includes.chroot/etc/tor
echo "
## Configuration file for a typical Tor user
## Last updated 22 April 2012 for Tor 0.2.3.14-alpha.
## (may or may not work for much older or much newer versions of Tor.)
##
## Lines that begin with \"## \" try to explain what's going on. Lines
## that begin with just \"#\"are disabled commands: you can enable them
## by removing the \"#\"symbol.
##
## See 'man tor', or https://www.torproject.org/docs/tor-manual.html,
## for more options you can use in this file.
##
## Tor will look for this file in various places based on your platform:
## https://www.torproject.org/docs/faq#torrc

## Tor opens a socks proxy on port 9050 by default -- even if you don't
## configure one below. Set \"SocksPort 0\"if you plan to run Tor only
## as a relay, and not make any local application connections yourself.
SocksPort 9050 # Default: Bind to localhost:9050 for local connections.
#SocksPort 192.168.0.1:9100 # Bind to this adddress:port too.

## Entry policies to allow/deny SOCKS requests based on IP address.
## First entry that matches wins. If no SocksPolicy is set, we accept
## all (and only) requests that reach a SocksPort. Untrusted users who
## can access your SocksPort may be able to learn about the connections
## you make.
#SocksPolicy accept 192.168.0.0/16
#SocksPolicy reject *

## Logs go to stdout at level \"notice\"unless redirected by something
## else, like one of the below lines. You can have as many Log lines as
## you want.
##
## We advise using \"notice\"in most cases, since anything more verbose
## may provide sensitive information to an attacker who obtains the logs.
##
## Send all messages of level 'notice' or higher to /var/log/tor/notices.log
#Log notice file /var/log/tor/notices.log
## Send every possible message to /var/log/tor/debug.log
#Log debug file /var/log/tor/debug.log
## Use the system log instead of Tor's logfiles
#Log notice syslog
## To send all messages to stderr:
#Log debug stderr

## Uncomment this to start the process in the background... or use
## --runasdaemon 1 on the command line. This is ignored on Windows;
## see the FAQ entry if you want Tor to run as an NT service.
#RunAsDaemon 1

## The directory for keeping all the keys/etc. By default, we store
## things in \$HOME/.tor on Unix, and in Application Data\tor on Windows.
#DataDirectory /var/lib/tor

## The port on which Tor will listen for local connections from Tor
## controller applications, as documented in control-spec.txt.
#ControlPort 9051
## If you enable the controlport, be sure to enable one of these
## authentication methods, to prevent attackers from accessing it.
#HashedControlPassword 16:872860B76453A77D60CA2BB8C1A7042072093276A3D701AD684053EC4C
#CookieAuthentication 1

############### This section is just for location-hidden services ###

## Once you have configured a hidden service, you can look at the
## contents of the file \".../hidden_service/hostname\" for the address
## to tell people.
##
## HiddenServicePort x y:z says to redirect requests on port x to the
## address y:z.

#HiddenServiceDir /var/lib/tor/hidden_service/
#HiddenServicePort 80 127.0.0.1:80

#HiddenServiceDir /var/lib/tor/other_hidden_service/
#HiddenServicePort 80 127.0.0.1:80
#HiddenServicePort 22 127.0.0.1:22

################ This section is just for relays #####################
#
## See https://www.torproject.org/docs/tor-doc-relay for details.

## Required: what port to advertise for incoming Tor connections.
#ORPort 9001
## If you want to listen on a port other than the one advertised in
## ORPort (e.g. to advertise 443 but bind to 9090), you can do it as
## follows.  You'll need to do ipchains or other port forwarding
## yourself to make this work.
#ORPort 443 NoListen
#ORPort 127.0.0.1:9090 NoAdvertise

## The IP address or full DNS name for incoming connections to your
## relay. Leave commented out and Tor will guess.
#Address noname.example.com

## If you have multiple network interfaces, you can specify one for
## outgoing traffic to use.
# OutboundBindAddress 10.0.0.5

## A handle for your relay, so people don't have to refer to it by key.
#Nickname ididnteditheconfig

## Define these to limit how much relayed traffic you will allow. Your
## own traffic is still unthrottled. Note that RelayBandwidthRate must
## be at least 20 KB.
## Note that units for these config options are bytes per second, not bits
## per second, and that prefixes are binary prefixes, i.e. 2^10, 2^20, etc.
#RelayBandwidthRate 100 KB  # Throttle traffic to 100KB/s (800Kbps)
#RelayBandwidthBurst 200 KB # But allow bursts up to 200KB/s (1600Kbps)

## Use these to restrict the maximum traffic per day, week, or month.
## Note that this threshold applies separately to sent and received bytes,
## not to their sum: setting \"4 GB\" may allow up to 8 GB total before
## hibernating.
##
## Set a maximum of 4 gigabytes each way per period.
#AccountingMax 4 GB
## Each period starts daily at midnight (AccountingMax is per day)
#AccountingStart day 00:00
## Each period starts on the 3rd of the month at 15:00 (AccountingMax
## is per month)
#AccountingStart month 3 15:00

## Contact info to be published in the directory, so we can contact you
## if your relay is misconfigured or something else goes wrong. Google
## indexes this, so spammers might also collect it.
#ContactInfo Random Person <nobody AT example dot com>
## You might also include your PGP or GPG fingerprint if you have one:
#ContactInfo 0xFFFFFFFF Random Person <nobody AT example dot com>

## Uncomment this to mirror directory information for others. Please do
## if you have enough bandwidth.
#DirPort 9030 # what port to advertise for directory connections
## If you want to listen on a port other than the one advertised in
## DirPort (e.g. to advertise 80 but bind to 9091), you can do it as
## follows.  below too. You'll need to do ipchains or other port
## forwarding yourself to make this work.
#DirPort 80 NoListen
#DirPort 127.0.0.1:9091 NoAdvertise
## Uncomment to return an arbitrary blob of html on your DirPort. Now you
## can explain what Tor is if anybody wonders why your IP address is
## contacting them. See contrib/tor-exit-notice.html in Tor's source
## distribution for a sample.
#DirPortFrontPage /etc/tor/tor-exit-notice.html

## Uncomment this if you run more than one Tor relay, and add the identity
## key fingerprint of each Tor relay you control, even if they're on
## different networks. You declare it here so Tor clients can avoid
## using more than one of your relays in a single circuit. See
## https://www.torproject.org/docs/faq#MultipleRelays
## However, you should never include a bridge's fingerprint here, as it would
## break its concealability and potentionally reveal its IP/TCP address.
#MyFamily \$keyid,\$keyid,...

## A comma-separated list of exit policies. They're considered first
## to last, and the first match wins. If you want to _replace_
## the default exit policy, end this with either a reject *:* or an
## accept *:*. Otherwise, you're _augmenting_ (prepending to) the
## default exit policy. Leave commented to just use the default, which is
## described in the man page or at
## https://www.torproject.org/documentation.html
##
## Look at https://www.torproject.org/faq-abuse.html#TypicalAbuses
## for issues you might encounter if you use the default exit policy.
##
## If certain IPs and ports are blocked externally, e.g. by your firewall,
## you should update your exit policy to reflect this -- otherwise Tor
## users will be told that those destinations are down.
##
## For security, by default Tor rejects connections to private (local)
## networks, including to your public IP address. See the man page entry
## for ExitPolicyRejectPrivate if you want to allow \"exit enclaving\".
##
#ExitPolicy accept *:6660-6667,reject *:* # allow irc ports but no more
#ExitPolicy accept *:119 # accept nntp as well as default exit policy
#ExitPolicy reject *:* # no exits allowed

## Bridge relays (or \"bridges\") are Tor relays that aren't listed in the
## main directory. Since there is no complete public list of them, even an
## ISP that filters connections to all the known Tor relays probably
## won't be able to block all the bridges. Also, websites won't treat you
## differently because they won't know you're running Tor. If you can
## be a real relay, please do; but if not, be a bridge!
#BridgeRelay 1
## By default, Tor will advertise your bridge to users through various
## mechanisms like https://bridges.torproject.org/. If you want to run
## a private bridge, for example because you'll give out your bridge
## address manually to your friends, uncomment this line:
#PublishServerDescriptor 0
DisableDebuggerAttachment 0

VirtualAddrNetwork 10.192.0.0/10
    AutomapHostsOnResolve 1
    TransPort 9040
    DNSPort 53

" > config/includes.chroot/etc/tor/torrc
mkdir -p config/includes.chroot/etc/sudoers.d/
echo 'paranoid ALL=(ALL) PASSWD: ALL' > config/includes.chroot/etc/sudoers.d/live
echo 'SU_TO_ROOT_SU=sudo
SU_TO_ROOT_X=gksudo' > config/includes.chroot/etc/su-to-rootrc
echo '### Freepto version /etc/sysctl.conf

# Do not accept ICMP redirects (prevent MITM attacks)
net.ipv4.conf.all.accept_redirects=0
net.ipv6.conf.all.accept_redirects=0

# Prevent against the common 'syn flood attack'
net.ipv4.tcp_syncookies=1

net.ipv4.tcp_timestamps=0

# TCP Hardening
net.ipv4.icmp_echo_ignore_broadcasts=1
net.ipv4.conf.all.forwarding=0

# Controls source route verification
net.ipv4.conf.all.rp_filter=1 

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0' > config/includes.chroot/etc/sysctl.conf

mkdir -p config/includes.chroot/etc/cron.daily
echo '#! /bin/sh
/usr/local/bin/rkhunter --propupd' > config/includes.chroot/etc/cron.daily/update-rkhunter
chmod a+x config/includes.chroot/etc/cron.daily/update-rkhunter
echo '#! /bin/sh
/usr/local/bin/rkhunter -c --sk' > config/includes.chroot/etc/cron.daily/run-rkhunter
chmod a+x config/includes.chroot/etc/cron.daily/run-rkhunter
echo '#! /bin/sh
/usr/local/bin/rkhunter --pkgmgr dpkg -c --sk' > config/includes.chroot/etc/cron.daily/deb-rkhunter
chmod a+x config/includes.chroot/etc/cron.daily/deb-rkhunter

mkdir -p config/includes.chroot/etc/skel/.mozilla/firefox
cp -r live.profile config/includes.chroot/etc/skel/.mozilla/firefox/live.profile

echo '#IP list

# News
theguardian.com 77.91.251.10
firstlook.org 4.53.16.143
bbc.co.uk 212.58.241.131
aljazeera.com 198.78.201.252
 
# Social media
google.com 74.125.157.99
youtube.com 74.125.65.91
github.com 207.97.227.239
 
# Torrent sites
thepiratebay.se 108.162.193.114
isohunt.to 198.41.190.233
 
# Social networking
facebook.com 69.171.224.11
twitter.com 199.59.149.230
tumblr.com 174.121.194.34
 
# Shopping
amazon.com 72.21.211.176
newegg.com 216.52.208.187
frys.com 209.31.22.39
 
# File Sharing
pastebin.com 190.93.243.15

# Information and Education
wikipedia.org 208.80.152.201
' > config/includes.chroot/etc/hosts

mkdir -p config/includes.chroot/etc/ssh/
echo '
# This is the ssh client system-wide configuration file.  See
# ssh_config(5) for more information.  This file provides defaults for
# users, and the values can be changed in per-user configuration files
# or on the command line.

# Configuration data is parsed as follows:
#  1. command line options
#  2. user-specific file
#  3. system-wide file
# Any configuration value is only changed the first time it is set.
# Thus, host-specific definitions should be at the beginning of the
# configuration file, and defaults at the end.

# Site-wide defaults for some commonly used options.  For a comprehensive
# list of available options, their meanings and defaults, please see the
# ssh_config(5) man page.

Host *
#   ForwardAgent no
#   ForwardX11 no
#   ForwardX11Trusted yes
#   RhostsRSAAuthentication no
#   RSAAuthentication yes
#   PasswordAuthentication yes
#   HostbasedAuthentication no
#   GSSAPIAuthentication no
#   GSSAPIDelegateCredentials no
#   GSSAPIKeyExchange no
#   GSSAPITrustDNS no
#   BatchMode no
#   CheckHostIP yes
#   AddressFamily any
#   ConnectTimeout 0
#   StrictHostKeyChecking ask
#   IdentityFile ~/.ssh/identity
#   IdentityFile ~/.ssh/id_rsa
#   IdentityFile ~/.ssh/id_dsa
#   Port 22
#   Protocol 2,1
#   Cipher 3des
#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com,hmac-ripemd160
#   EscapeChar ~
#   Tunnel no
#   TunnelDevice any:any
#   PermitLocalCommand no
#   VisualHostKey no
#   RekeyLimit 1G 1h
    ProxyCommand nc -X 5 -x localhost:9150 %h %p
    VerifyHostKeyDNS no
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials no
' > config/includes.chroot/etc/ssh/ssh_config