#!/bin/bash
#Bon-chan autoscript installer

apt-get install wget -y
apt-get install curl -y
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
clear
echo -e 'INSTALLING SCRIPTS....'
rm -f DebianVPS* && wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/DebianVPS-Installer' && chmod +x DebianVPS-Installer && ./DebianVPS-Installer

 echo -e 'PLEASE WAIT... The Script is sleeping for at least 3 minutes to make sure there are no installation running in background before we proceed.'
sleep 200

 echo -e " 3 minutes has passed. The Script is now ready for its next step."
 apt install squid
 wget -qO /etc/squid/squid.conf https://raw.githubusercontent.com/jyssibel08/unimportant2/main/squid.conf
 service squid restart

 OvpnDownload_Port="86"
 IPADDR="$(curl -4skL http://ipinfo.io/ip)"
 
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
systemctl stop syslog
systemctl disable syslog
systemctl stop syslog.socket
systemctl disable syslog.socket
}
       
setting
#!/bin/bash

# Path to the OpenVPN configuration files
tcp_conf_path="/etc/openvpn/tcp.conf"
udp_conf_path="/etc/openvpn/udp.conf"

# The new port numbers you want to set
new_tcp_port="443"  # Replace with the port number for TCP
new_udp_port="110"  # Replace with the port number for UDP

# Validate that the files exist
if [ ! -f "$tcp_conf_path" ]; then
    echo "The file $tcp_conf_path does not exist."
    exit 1
fi

if [ ! -f "$udp_conf_path" ]; then
    echo "The file $udp_conf_path does not exist."
    exit 1
fi

# Change the port number in TCP config
# This assumes that the current port is specified as 'port XYZ'
sed -i "s/^port .*/port $new_tcp_port/" $tcp_conf_path

# Change the port number in UDP config
# This assumes that the current port is specified as 'port XYZ'
sed -i "s/^port .*/port $new_udp_port/" $udp_conf_path

echo "TCP and UDP port numbers have been changed."	
bash /etc/profile.d/bonv.sh
echo -e "========================================"
echo -e "Command: menu" | lolcat
echo -e ""
echo -e "========================================"
echo -e "OpenSSH: 22, 225" | lolcat
echo -e "========================================"
echo -e "OpenVPN: 443(TCP), 110(UDP)" | lolcat
echo -e "========================================"
echo -e "Squid: 8000, 8080" | lolcat
echo -e "========================================"
echo -e "OPENVPN CONFIGS"
echo -e "========================================"
echo -e "http://$(wget -4qO- http://ipinfo.io/ip):86/OVPN.zip" | lolcat
echo -e "========================================"
echo -e ""
echo -e "XAMSCRIPT" | lolcat

 rm -rf /root/.bash_history && history -c && echo '' > /var/log/syslog
 
 bash -c "sed -ir "/\([[:space:]]\|^\)\(data-ciphers\|cipher\|auth\|ncp-disable\|plugin[[:space:]]\).*/d" {/var/www/openvpn/*.ovpn,/etc/openvpn/{*.conf,server/*.conf}};sed -i "\$a cipher AES-128-GCM\nauth SHA1" {/var/www/openvpn/*.ovpn,/etc/openvpn/{*.conf,server/*.conf}};sed -i "\$a data-ciphers AES-128-GCM:AES-128-CBC\nplugin $(find /{usr,etc} -type f -name "*-auth-pam.so"|head -n1) /etc/pam.d/login" /etc/openvpn/{*.conf,server/*.conf};systemctl restart openvpn-server@{ec_s,s}erver_{tc,ud}p;" 2>/dev/null
