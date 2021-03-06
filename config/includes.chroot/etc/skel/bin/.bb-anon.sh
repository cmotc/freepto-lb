#
# You should have received a copy of the GNU General Public License
# along with backbox-anonymous. If not, see .

export BLUE='\\033[1;94m'
export GREEN='\\033[1;92m'
export RED='\\033[1;91m'
export ENDC='\\033[1;00m'

# Destinations you don't want routed through Tor
NON_TOR="192.168.0.0/16 172.16.0.0/12 10.0.0.0/8"

# The GID Tor runs as
TOR_GID="debian-tor"

# Tor's TransPort
TRANS_PORT="9040"

case "$1" in
    start)
        # Make sure only root can run this script
        if [ $(id -u) -ne 0 ]; then
          echo "
$RED[!] This script must be run as root$ENDC
" >&2
          exit 1
        fi
        
        # Check torrc config file
        grep -q -x 'VirtualAddrNetwork 10.192.0.0/10' /etc/tor/torrc
        if [ $? -ne 0 ]; then
            echo "
$RED[!] Please add the following to your /etc/tor/torrc and restart service:$ENDC
" >&2
            echo "$BLUE#----------------------------------------------------------------------#$ENDC"
            echo "VirtualAddrNetwork 10.192.0.0/10"
            echo "AutomapHostsOnResolve 1"
            echo "TransPort 9040"
            echo "DNSPort 53"
            echo "$BLUE#----------------------------------------------------------------------#$ENDC
"
            exit 1
        fi
        grep -q -x 'AutomapHostsOnResolve 1' /etc/tor/torrc
        if [ $? -ne 0 ]; then
            echo "
$RED[!] Please add the following to your /etc/tor/torrc and restart service:$ENDC
" >&2
            echo "$BLUE#----------------------------------------------------------------------#$ENDC"
            echo "VirtualAddrNetwork 10.192.0.0/10"
            echo "AutomapHostsOnResolve 1"
            echo "TransPort 9040"
            echo "DNSPort 53"
            echo "$BLUE#----------------------------------------------------------------------#$ENDC
"
            exit 1
        fi
        grep -q -x 'TransPort 9040' /etc/tor/torrc
        if [ $? -ne 0 ]; then
            echo "
$RED[!] Please add the following to your /etc/tor/torrc and restart service:$ENDC
" >&2
            echo "$BLUE#----------------------------------------------------------------------#$ENDC"
            echo "VirtualAddrNetwork 10.192.0.0/10"
            echo "AutomapHostsOnResolve 1"
            echo "TransPort 9040"
            echo "DNSPort 53"
            echo "$BLUE#----------------------------------------------------------------------#$ENDC
"
            exit 1
        fi
        grep -q -x 'DNSPort 53' /etc/tor/torrc
        if [ $? -ne 0 ]; then
            echo "
$RED[!] Please add the following to your /etc/tor/torrc and restart service:$ENDC
" >&2
            echo "$BLUE#----------------------------------------------------------------------#$ENDC"
            echo "VirtualAddrNetwork 10.192.0.0/10"
            echo "AutomapHostsOnResolve 1"
            echo "TransPort 9040"
            echo "DNSPort 53"
            echo "$BLUE#----------------------------------------------------------------------#$ENDC
"
            exit 1
        fi

        echo "
$BLUE[i] Starting anonymous mode:$ENDC
"
        
        if [ ! -e /var/run/tor/tor.pid ]; then
            echo " $RED*$ENDC Tor is not running! Quitting...
" >&2
            exit 1
        fi
        
        iptables -F
        iptables -t nat -F
        echo " $GREEN*$ENDC Deleted all iptables rules"

        echo 'nameserver 127.0.0.1' > /etc/resolv.conf
        echo " $GREEN*$ENDC Modified resolv.conf to use Tor"

        iptables -t nat -A OUTPUT -m owner --gid-owner $TOR_GID -j RETURN
        iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 53
        for NET in $NON_TOR 127.0.0.0/9 127.128.0.0/10; do
            iptables -t nat -A OUTPUT -d $NET -j RETURN
        done
        iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports $TRANS_PORT
        iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        for NET in $NON_TOR 127.0.0.0/8; do
                iptables -A OUTPUT -d $NET -j ACCEPT
        done
        iptables -A OUTPUT -m owner --gid-owner $TOR_GID -j ACCEPT
        iptables -A OUTPUT -j REJECT
        echo "$GREEN *$ENDC Redirected all traffic throught Tor
"

        echo "$BLUE[i] Are you using Tor?$ENDC
"
        echo "$GREEN *$ENDC Please refer to https://check.torproject.org
"
    ;;
    stop)
        # Make sure only root can run our script
        if [ $(id -u) -ne 0 ]; then
          echo "
$RED[!] This script must be run as root$ENDC
" >&2
          exit 1
        fi
        
        echo "
$BLUE[i] Stopping anonymous mode:$ENDC
"

        echo 'nameserver 208.67.222.222' >  /etc/resolv.conf
        echo 'nameserver 208.67.220.220' >> /etc/resolv.conf
        echo " $GREEN*$ENDC Modified resolv.conf to use OpenDNS"
        
        iptables -F
        iptables -t nat -F
        echo " $GREEN*$ENDC Deleted all iptables rules
"
	sudo service ferm restart
        echo " $GREEN*$ENDC Restarted system firewall
"
    ;;
    restart)
        $0 stop
        $0 start
    ;;
    *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
esac

exit 0
