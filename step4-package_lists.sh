#! /bin/sh
echo ":'
##Generating the package lists
'"

echo "
abiword					
abiword-common				
abiword-plugin-grammar			
abiword-plugin-mathview			
aircrack-ng				
anjuta					
anjuta-common				
anjuta-extras				
apg					
apparmor				
apparmor-docs				
apparmor-profiles			
apparmor-utils				
banshee					
bitcoind				
bleachbit				
blueman					
blueproximity				
bluetooth				
bluewho					
conky-std				
crawl-common				
crawl-tiles				
crawl-tiles-data			
dconf-cli				
dconf-editor				
dconf-gsettings-backend:amd64		
dconf-service				
dconf-tools				
dctrl-tools				
deb.torproject.org-keyring		
debconf					
debconf-i18n				
debhelper				
debian-archive-keyring			
debian-faq				
debian-keyring				
deb.torproject.org-keyring
debianutils				
debootstrap				
default-jre				
default-jre-headless			
desktop-base				
desktop-file-utils			
devhelp-common				
devscripts				
dia					
dia-common				
dia-libs				
dia-shapes				
doc-base				
doc-debian				
docbook-xml				
docutils-common				
docutils-doc				
doxygen					
dpkg					
dpkg-dev				
dpkg-sig				
enigmail				
epiphany-browser			
epiphany-browser-data			
epiphany-browser-dbg			
fdroidserver				
ferm					
filezilla				
filezilla-common			
foxyproxy				
freeciv-client-sdl			
freeciv-data				
freeciv-server				
gnome-accessibility-themes		
gnome-applets				
gnome-applets-data			
gnome-backgrounds			
gnome-bluetooth				
gnome-calculator				
gnome-color-manager			
gnome-contacts				
gnome-control-center			
gnome-control-center-data		
gnome-desktop-data			
gnome-desktop3-data			
gnome-dictionary			
gnome-disk-utility			
gnome-documents				
gnome-flashback				
gnome-flashback-common			
gnome-font-viewer			
gnome-icon-theme			
gnome-icon-theme-extras			
gnome-icon-theme-symbolic		
gnome-js-common				
gnome-keyring				
gnome-media				
gnome-menus				
gnome-mime-data				
gnome-nettool				
gnome-online-accounts			
gnome-online-miners			
gnome-orca				
gnome-packagekit			
gnome-packagekit-data			
gnome-packagekit-session		
gnome-panel				
gnome-panel-data			
gnome-power-manager			
gnome-screensaver			
gnome-screenshot			
gnome-session				
gnome-session-bin			
gnome-session-common			
gnome-session-fallback			
gnome-session-flashback			
gnome-settings-daemon			
gnome-shell				
gnome-shell-common			
gnome-shell-extension-autohidetopbar	
gnome-shell-extension-weather		
gnome-shell-extensions			
gnome-sushi				
gnome-system-log			
gnome-system-monitor			
gnome-terminal				
gnome-terminal-data			
gnome-themes-standard:amd64		
gnome-themes-standard-data		
gnome-tweak-tool			
gnome-user-guide			
gnome-user-share			
gnome-video-effects			
gnumeric				
gnumeric-common				
gnumeric-doc				
gnupg					
gnupg-agent				
gnupg2					
guake					
harden		
harden-development
harden-tools		
hardening-includes			
hexchat					
i2p					
i2p-keyring				
i2p-router				
icedove					
icedove-dispmua				
icedtea-6-jre-cacao:amd64		
icedtea-6-jre-jamvm:amd64		
icedtea-7-jre-jamvm:amd64		
icedtea-netx:amd64			
icedtea-netx-common			
iceweasel				
imagemagick				
imagemagick-6.q16			
imagemagick-common	
killyourtv-keyring	
liferea					
liferea-data				
lightsoff				
lintian					
linux-image-amd64			
linux-libc-dev:amd64			
live-boot-doc				
live-build				
live-config-doc				
live-manual-html			
lynx					
lynx-cur				
macchanger				
nufw
pidcat					
pidgin					
pidgin-data				
pidgin-gnome-keyring			
pidgin-otr				
privoxy					
pulseaudio				
pulseaudio-module-bluetooth		
pulseaudio-module-bluetooth-dbg		
pulseaudio-module-x11			
pulseaudio-utils			
rat
reaver					
rkhunter
rygel					
rygel-playbin				
rygel-preferences			
rygel-tracker				
secure-delete				
tomboy					
tor					
tor-arm					
tor-geoipdb				
torsocks				
totem					
totem-common				
totem-plugins				
transmission-common			
transmission-gtk
turpial					
twister-core				
unetbootin				
unetbootin-translations			
utox
w3af					
w3af-console				
wifite					
xul-ext-adblock-plus			
xul-ext-certificatepatrol		
xul-ext-cookie-monster			
xul-ext-dispmua				
xul-ext-firebug				
xul-ext-foxyproxy-standard		
xul-ext-gnome-keyring			
xul-ext-https-everywhere		
xul-ext-noscript			
xul-ext-perspectives			
xul-ext-refcontrol			
xul-ext-requestpolicy			
xul-ext-torbirdy			
xul-ext-useragentswitcher		
youtube-dl				
" > config/package-lists/Packages.list.chroot
cp config/package-lists/Packages.list.chroot config/package-lists/Packages.list.binary
echo "apt-transport-https
" > config/package-lists/Packages.list.bootstrap
#echo -n 'APT::Default-Release "jessie";'> config/apt/apt.conf
