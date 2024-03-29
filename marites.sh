echo "deb http://security.ubuntu.com/ubuntu xenial-security main" >> /etc/apt/sources.list
sudo apt update
sudo apt install libssl1.0.0

#Bon-chan autoscript installer
echo -e 'THIS SCRIPT IS BASE ON BONVSCRIPTS.'
rm -f UbuntuVPS* && wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/UbuntuVPS-Installer' && chmod +x UbuntuVPS-Installer && ./UbuntuVPS-Installer

echo -e 'PLEASE WAIT... The Script is sleeping for at least 3 minutes to make sure there are no installation running in background before we proceed.'
sleep 200
echo -e '3 minutes has passed, now we are ready to proceed.'

 OvpnDownload_Port="86"
 IPADDR="$(curl -4skL http://ipinfo.io/ip)"

# adding OVPN Websocket Config
cat <<EOF186> /var/www/openvpn/Websocket.ovpn
# OpenVPN Server build v2.5.4
client
dev tun
persist-tun
proto tcp
remote $(curl -s http://ipinfo.io/ip || wget -q http://ipinfo.io/ip) 110
persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
auth-user-pass
<ca>
$(cat /etc/openvpn/ca.crt)
</ca>
EOF186
# deleting OVPN Config site
cd /var/www/openvpn
rm -rf index.html
cd
# Creating new OVPN Config site
cat <<'mySiteOvpns' > /var/www/openvpn/index.html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="XAMJYSS143 (fb.com/xamjyss143)">
	
	<title>OpenVPN Config Files</title>
	<link rel="shortcut icon" href="https://xamjyssvpn.com/script/vpn.png">
	
	<!-- Bootstrap -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.no-icons.min.css" rel="stylesheet">
	<!-- Icons -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- Fonts -->
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alice|Open+Sans:400,300,700">
	<!-- Custom styles -->
	<link rel="stylesheet" href="https://xamjyssvpn.com/script/styles.css">
	<!--[if lt IE 9]> <script src="assets/js/html5shiv.js"></script> <![endif]-->
</head>
<body class="home">
<header id="header">
	<div id="head" class="parallax" parallax-speed="2">
		<h1 id="logo" class="text-center">
			<img class="img-circle" src="https://xamjyssvpn.com/script/vpn.png" alt="">
			<span class="title">XAMJYSSVPN<br>&<br>CoronaSSH</span>
			<span class="tagline">Making great things, Simply amazing</span>
		</h1>
	</div>
</header>
<main id="main">
	<div class="container">
		
		<div class="row section featured topspace">
			<h2 class="section-title"><span>OpenVPN Configs</span></h2>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<h3 class="text-center">ALL IN ONE OVPN FILES</h3>
					<p class="text-center"><a href="http://IP-ADDRESS:NGINXPORT/OVPN.zip" class="btn btn-action">Download</a></p>
				</div>
			</div>
		</div> <!-- / section -->
	
		<div class="row section recentworks topspace">
			
			<h2 class="section-title"><span>Website List</span></h2>
			<div class="row">
				<div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">XAMJYSSVPN</h3>
					<p class="text-center"><a target="_blank" href="https://xamjyssvpn.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">CoronaSSH</h3>
					<p class="text-center"><a target="_blank" href="https://coronassh.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">Shadowsocks</h3>
					<p class="text-center"><a target="_blank" href="https://ss.coronassh.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">URLTOEARN</h3>
					<p class="text-center"><a target="_blank" href="https://srt.xamjyssvpn.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">DROPTOEARN</h3>
					<p class="text-center"><a target="_blank" href="https://up.xamjyssvpn.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">PHP SHORTENER</h3>
					<p class="text-center"><a target="_blank" href="https://php.coronassh.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">CURL SHORTENER</h3>
					<p class="text-center"><a target="_blank" href="https://url.coronassh.com" class="btn btn-action">Visit Now</a></p>
				</div>
                <div class="col-sm-12 col-md-3 text-center">
					<h3 class="text-center">NOTCH-PAD</h3>
					<p class="text-center"><a target="_blank" href="https://note.coronassh.com" class="btn btn-action">Visit Now</a></p>
				</div>
			</div>
		</div> <!-- /section -->
	</div>	<!-- /container -->
</main>
<style>
    @media (min-width: 1200px){
            .container {
                max-width: 1200px;
        }
    }
</style>
<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="https://xamjyssvpn.com/script/template.js"></script>
</body>
</html>
mySiteOvpns
 
 sed -i "s|NGINXPORT|$OvpnDownload_Port|g" /var/www/openvpn/index.html
 sed -i "s|IP-ADDRESS|$IPADDR|g" /var/www/openvpn/index.html
 
 # Creating all .ovpn config archives
 cd /var/www/openvpn
 zip -qq -r OVPN.zip *.ovpn
 cd
# script for SSH Websocket
function service() {
cat << PTHON > /usr/sbin/yakult
#!/usr/bin/python
import socket, threading, thread, select, signal, sys, time, getopt
# Listen
LISTENING_ADDR = '0.0.0.0'
if sys.argv[1:]:
  LISTENING_PORT = sys.argv[1]
else:
  LISTENING_PORT = 80
# Pass
PASS = ''
# CONST
BUFLEN = 4096 * 4
TIMEOUT = 86400
DEFAULT_HOST = '127.0.0.1:550'
RESPONSE = 'HTTP/1.1 101 <font color="yellow">XAMJYSSVPN|CoronaSSH</font>\r\n\r\nContent-Length: 104857600000\r\n\r\n'
class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()
    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True
        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue
                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()
    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()
    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()
    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()
    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()
            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()
class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)
    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True
        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True
    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)
            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')
            if hostPort == '':
                hostPort = DEFAULT_HOST
            split = self.findHeader(self.client_buffer, 'X-Split')
            if split != '':
                self.client.recv(BUFLEN)
            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')
        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)
    def findHeader(self, head, header):
        aux = head.find(header + ': ')
        if aux == -1:
            return ''
        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')
        if aux == -1:
            return ''
        return head[:aux];
    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 443
            else:
                port = sys.argv[1]
        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]
        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)
    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path
        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''
        self.server.printLog(self.log)
        self.doCONNECT()
    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]
                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break
def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'
def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)
def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    print "\n:-------PythonProxy-------:\n"
    print "Listening addr: " + LISTENING_ADDR
    print "Listening port: " + str(LISTENING_PORT) + "\n"
    print ":-------------------------:\n"
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()
    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Stopping...'
            server.close()
            break
#######    parse_args(sys.argv[1:])
if __name__ == '__main__':
    main()
PTHON
}
function service1() {
cat << END > /lib/systemd/system/yakult.service
[Unit]
Description=Yakult
Documentation=https://google.com
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
NoNewPrivileges=true
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
ExecStart=/usr/bin/python -O /usr/sbin/yakult
ProtectSystem=true
ProtectHome=true
RemainAfterExit=yes
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
}

# script for OVPN Websocket

function gatorade() {
cat << PTHON > /usr/sbin/gatorade
#!/usr/bin/python
import socket, threading, thread, select, signal, sys, time, getopt
# Listen
LISTENING_ADDR = '0.0.0.0'
if sys.argv[1:]:
  LISTENING_PORT = sys.argv[1]
else:
  LISTENING_PORT = 80
# Pass
PASS = ''
# CONST
BUFLEN = 4096 * 4
TIMEOUT = 86400
DEFAULT_HOST = '127.0.0.1:110'
RESPONSE = 'HTTP/1.1 101 <font color="green">XAMJYSSVPN|CoronaSSH</font>\r\n\r\nContent-Length: 104857600000\r\n\r\n'
class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()
    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True
        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue
                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()
    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()
    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()
    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()
    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()
            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()
class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)
    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True
        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True
    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)
            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')
            if hostPort == '':
                hostPort = DEFAULT_HOST
            split = self.findHeader(self.client_buffer, 'X-Split')
            if split != '':
                self.client.recv(BUFLEN)
            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')
        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)
    def findHeader(self, head, header):
        aux = head.find(header + ': ')
        if aux == -1:
            return ''
        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')
        if aux == -1:
            return ''
        return head[:aux];
    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 443
            else:
                port = sys.argv[1]
        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]
        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)
    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path
        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''
        self.server.printLog(self.log)
        self.doCONNECT()
    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]
                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break
def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'
def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)
def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    print "\n:-------PythonProxy-------:\n"
    print "Listening addr: " + LISTENING_ADDR
    print "Listening port: " + str(LISTENING_PORT) + "\n"
    print ":-------------------------:\n"
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()
    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Stopping...'
            server.close()
            break
#######    parse_args(sys.argv[1:])
if __name__ == '__main__':
    main()
PTHON
}
function gatorade1() {
cat << END > /lib/systemd/system/gatorade.service
[Unit]
Description=Gatorade
Documentation=https://google.com
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
NoNewPrivileges=true
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
ExecStart=/usr/bin/python -O /usr/sbin/gatorade
ProtectSystem=true
ProtectHome=true
RemainAfterExit=yes
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
}

#changing SSH Banner
SSH_Banner='https://raw.githubusercontent.com/jyssibel08/unimportant2/main/banner'
 rm -f /etc/banner
 wget -qO /etc/banner "$SSH_Banner"
 dos2unix -q /etc/banner
 systemctl restart ssh
 systemctl restart sshd
 systemctl restart dropbear
 
function setting() {
service ssh restart
service sshd restart
service dropbear restart
systemctl daemon-reload
systemctl enable $proto
systemctl restart $proto
systemctl daemon-reload
systemctl stop syslog
systemctl disable syslog
systemctl stop syslog.socket
systemctl disable syslog.socket
}


            echo -e "—————————————— Select Websocket Protocol——————————————"""
    echo -e "${Green}1.${Font}  SSH Websocket"
    echo -e "${Green}2.${Font}  OVPN Websocket"
    
read -rp "Please Select a Protocol：" menu_num2
    case $menu_num2 in
    1)
	service
	service1
	proto="yakult"
	type_1="ssh"
	type_2="OpenSSH"
	;;
    2)
	gatorade
	gatorade1
	proto="gatorade"
	type_1="ovpn"
	type_2="OpenVPN"
	;;
    *)
        echo -e "${RedBG}Please enter the correct number ${Font}"
	exit
        ;;
    esac

setting
#timedatectl set-timezone Asia/Manila
#write out current crontab

crontab -r
crontab -l > mycron
echo -e "0 */6 * * * sudo service $proto restart" >> mycron
echo -e "0 */6 * * * sudo service openvpn restart" >> mycron
echo -e "0 */6 * * * sudo service dropbear restart" >> mycron
echo -e "0 */6 * * * sudo service stunnel4 restart" >> mycron
echo -e "0 */6 * * * sudo service squid restart" >> mycron
crontab mycron
service cron restart
service cron restart

#crontab -l > mycron
#echo new cron into cron file
#echo -e "0 3 * * * rm -rf /var/log/*" >> mycron
#echo -e "0 3 * * * /sbin/reboot >/dev/null 2>&1" >> mycron
#install new cron file
#crontab mycron
#service cron restart
#echo '0 3 * * * rm -rf /var/log/*' >> /etc/cron.d/mycron
#echo '0 3 * * * /sbin/reboot >/dev/null 2>&1' >> /etc/cron.d/mycron
#service cron restart
#script for auto dns
sudo apt install python -y
 clear
[[ ! "$(command -v curl)" ]] && apt install curl -y -qq
[[ ! "$(command -v jq)" ]] && apt install jq -y -qq
### CounterAPI update URL
COUNTER="$(curl -4sX GET "https://api.countapi.xyz/hit/BonvScripts/DebianVPS-Installer" | jq -r '.value')"
IPADDR="$(curl -4skL http://ipinfo.io/ip)"
GLOBAL_API_KEY="c97584c5eed63361697206e79760ba56d2a28"
CLOUDFLARE_EMAIL="maxmaagad123@gmail.com"
DOMAIN_NAME_TLD="public-vpn.com"
DOMAIN_ZONE_ID="e7d3e192ad02c30e718fcb645a3e88f2"
### DNS hostname / Payload here
## Setting variable
####
## Creating file dump for DNS Records 
TMP_FILE='/tmp/abonv.txt'
curl -sX GET "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records?type=A&count=1000&per_page=1000" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "Content-Type: application/json" | python -m json.tool > "$TMP_FILE"
## Getting Existed DNS Record by Locating its IP Address "content" value
CHECK_IP_RECORD="$(cat < "$TMP_FILE" | jq '.result[]' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' | jq '. | select(.content=='\"$IPADDR\"')' | jq -r '.content' | awk '!a[$0]++')"
cat < "$TMP_FILE" | jq '.result[]' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' | jq '. | select(.content=='\"$IPADDR\"')' | jq -r '.name' | awk '!a[$0]++' | head -n1 > /tmp/abonv_existed_hostname
cat < "$TMP_FILE" | jq '.result[]' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' | jq '. | select(.content=='\"$IPADDR\"')' | jq -r '.id' | awk '!a[$0]++' | head -n1 > /tmp/abonv_existed_dns_id
function ExistedRecord(){
 MYNS="$(cat /tmp/abonv_existed_hostname)"
 MYNS_ID="$(cat /tmp/abonv_existed_dns_id)"
}
if [[ "$IPADDR" == "$CHECK_IP_RECORD" ]]; then
 ExistedRecord
 echo -e " IP Address already registered to database."
 echo -e " DNS: $MYNS"
 echo -e " DNS ID: $MYNS_ID"
 echo -e ""
 else
db_flagt="$(curl -4skL http://ipinfo.io/country)"
echo -e "Your IP Address:\033[0;35m $IPADDR\033[0m"
#read -p "Enter desired DNS: "  servername
#read -p "Enter desired servername: "  servernames
### Creating a DNS Record
function CreateRecord(){
TMP_FILE2='/tmp/abonv2.txt'
TMP_FILE3='/tmp/abonv3.txt'
curl -sX POST "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"$COUNTER\",\"content\":\"$IPADDR\",\"ttl\":86400,\"proxied\":true}" | python -m json.tool > "$TMP_FILE2"
cat < "$TMP_FILE2" | jq '.result' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' > /tmp/abonv22.txt
rm -f "$TMP_FILE2"
mv /tmp/abonv22.txt "$TMP_FILE2"
MYDNS="$(cat < "$TMP_FILE2" | jq -r '.name')"
MYDNS_ID="$(cat < "$TMP_FILE2" | jq -r '.id')"
curl -sX POST "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"$COUNTER.$db_flagt\",\"content\":\"$IPADDR\",\"ttl\":1,\"proxied\":false}" | python -m json.tool > "$TMP_FILE3"
cat < "$TMP_FILE3" | jq '.result' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' > /tmp/abonv33.txt
rm -f "$TMP_FILE3"
mv /tmp/abonv33.txt "$TMP_FILE3"
MYNS="$(cat < "$TMP_FILE3" | jq -r '.name')"
MYNS_ID="$(cat < "$TMP_FILE3" | jq -r '.id')"
echo "$MYNS" > nameserver.txt
}
 CreateRecord
 echo -e " Registering your IP Address.."
 echo -e " DNS: $MYDNS"
 echo -e " DNS ID: $MYDNS_ID"
 echo -e " DNS: $MYNS"
 echo -e " DNS ID: $MYNS_ID"
 echo -e ""
fi
rm -rf /tmp/abonv*
echo -e "$DOMAIN_NAME_TLD" > /tmp/abonv_mydns_domain
echo -e "$MYDNS" > /tmp/abonv_mydns
echo -e "$MYDNS_ID" > /tmp/abonv_mydns_id


sudo apt install mariadb-server

#fonts color
Green="\033[32m"
Red="\033[31m"
Yellow="\033[33m"
GreenBG="\033[42;37m"
RedBG="\033[41;37m"
Font="\033[0m"
    echo -e "—————————————— Select Root Password Type ——————————————"""
    echo -e "${Yellow}1.${Font}  ROOT"
    echo -e "${Green}2.${Font}  DO \n"
    
read -rp "Please select VPS password：" menu_num1
    case $menu_num1 in
    1)
	db_root_password="WHdsKzVkR1RWQmhScWJwUXYvd3JhNm42bThaQkxsTXR4ZnJnTk5IL0lTcz0="
	;;
    2)
	db_root_password="VEY0TmpUTmhTdUhuTTB6SlVnREFhUT09"
	;;
    *)
        echo -e "${RedBG}Please enter the correct number ${Font}"
        ;;
    esac
            echo -e "—————————————— Select Server Category——————————————"""
    echo -e "${Green}1.${Font}  Asia"
    echo -e "${Green}2.${Font}  Africa"
    echo -e "${Green}3.${Font}  Europe"
    echo -e "${Green}4.${Font}  America"
    echo -e "${Green}5.${Font}  Australia/Oceania \n"
    
read -rp "Please Enter Category：" menu_num2
    case $menu_num2 in
    1)
	db_category="asia"
	;;
    2)
	db_category="africa"
	;;
    3)
	db_category="europe"
	;;
    4)
	db_category="america"
	;;
    5)
	db_category="australia"
	;;
    *)
        echo -e "${RedBG}Please enter the correct number ${Font}"
	exit
        ;;
    esac
read -p "Please enter panel host number count: "  db_hostname
read -p "Please enter account validity: "  valid
read -p "Please Enter amount of maximum user: "  max
db_location="$(curl -4skL http://ipinfo.io/city)"
y=${db_flagt,,}
country_name="$(curl -4skL http://api.ipstack.com/$(curl -s https://ipinfo.io/ip)?access_key=acdefdfb4ea065c16ec65196e432edf0 | jq -r '.country_name')"
	mysql -umarites -pXamjyss14302082020! -h142.44.136.130 -e"USE marites
	INSERT INTO servers (host, host_address, type, category, ws_dns, hostname, validity, max_user, root_password, location, flag) VALUES ('$country_name $db_hostname', '$IPADDR', '$type_1', '$db_category', '$MYDNS', '$MYNS', '$valid', '$max', '$db_root_password', '$db_location', '$y');"
	
	
bash /etc/profile.d/bonv.sh
systemctl enable openvpn
systemctl restart openvpn
echo -e " Success Installation"
 echo -e ""
 echo -e " Service Ports: "
 echo -e " OpenSSH: 225, 22"
 echo -e " Stunnel: 443, 444, 587"
 echo -e " DropbearSSH: 550, 555"
 echo -e " OpenVPN: 25222(UDP), 110(TCP)"
 echo -e " OpenVPN EC: 25980(TCP), 25985(UDP)"
 echo -e " Squid: 8000, 8080"
 echo -e " Webmin: 10000"
 echo -e " BadVPN-udpgw: 7300"
 echo -e " NGiNX: 86"
 echo -e ""
 echo -e " NEW! OHPServer builds"
 echo -e " (Good for Payload bugging and any related HTTP Experiments)"
 echo -e ""
 echo -e " OHP+Dropbear: 8085"
 echo -e " OHP+OpenSSH: 8086"
 echo -e " OHP+OpenVPN: 8087"
 echo -e " OHP+OpenVPN Elliptic Curve: 8088"
 echo -e ""
 echo -e " Websocket Service Ports: "
 echo -e ""
 echo -e " $type_2 WS: 80"
 echo -e " OpenSSL WS: 443"
 echo -e ""
 echo -e " IP Address: $IPADDR"
 echo -e " DNS: $MYNS"
 echo -e " Websocket DNS (Proxied): $MYDNS"
 echo -e ""
 echo -e " OpenVPN Configs Download site"
 echo -e " http://$IPADDR:86"
 echo -e ""
 echo -e " [Note] DO NOT RESELL THIS SCRIPT"
 rm -rf /root/.bash_history && history -c && echo '' > /var/log/syslog
 
#wget -N --no-check-certificate -c -t3 -T60 -O ss-plugins.sh https://raw.githubusercontent.com/jyssibel08/Shell/master/ss-plugins.sh && chmod +x ss-plugins.sh && ./ss-plugins.sh

 # Clearing all logs from installation
 rm -rf /root/.bash_history && history -c && echo '' > /var/log/syslog
  bash -c "sed -ir "/\([[:space:]]\|^\)\(data-ciphers\|cipher\|auth\|ncp-disable\|plugin[[:space:]]\).*/d" {/var/www/openvpn/*.ovpn,/etc/openvpn/{*.conf,server/*.conf}};sed -i "\$a cipher AES-128-GCM\nauth SHA1" {/var/www/openvpn/*.ovpn,/etc/openvpn/{*.conf,server/*.conf}};sed -i "\$a data-ciphers AES-128-GCM:AES-128-CBC\nplugin $(find /{usr,etc} -type f -name "*-auth-pam.so"|head -n1) /etc/pam.d/login" /etc/openvpn/{*.conf,server/*.conf};systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p;" 2>/dev/null
  bash -c "sed -i "/ncp-disable/d" /etc/openvpn/server/*.conf;systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p"

