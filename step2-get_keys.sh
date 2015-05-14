#! /bin/sh
echo ":'
##Getting the Supplemental Repository Keys
'"

echo ":'
###Downloading the Tor repository keys
'"

torsocks gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export 886DDD89 > config/archives/tor.list.key.chroot
cp config/archives/tor.list.key.chroot config/archives/tor.list.key.binary

echo ":'
###Downloading the i2p repository keys
'"

torsocks wget https://geti2p.net/_static/i2p-debian-repo.key.asc -O config/archives/i2p2.asc
mv config/archives/i2p2.asc config/archives/i2p2.list.key.chroot
cp config/archives/i2p2.list.key.chroot config/archives/i2p2.list.key.binary

echo ":'
###Downloading the namecoin repository keys
'"

wget http://download.opensuse.org/repositories/home:p_conrad:coins/Debian_7.0/Release.key -O config/archives/namecoin.list.key.chroot
cp config/archives/namecoin.list.key.chroot config/archives/namecoin.list.key.binary

echo ":'
###Downloading the Tox.im repository keys
'"

torsocks wget https://repo.tox.im/pubkey.gpg -O config/archives/toxim.list.key.chroot
cp config/archives/toxim.list.key.chroot config/archives/toxim.list.key.binary

echo ":'
###Downloading the Twister repository keys
'"

torsocks gpg --keyserver keyserver.ubuntu.com --recv-keys 9F5116BD
gpg --export 9F5116BD > config/archives/twister.list.key.chroot
cp config/archives/twister.list.key.chroot config/archives/twister.list.key.binary