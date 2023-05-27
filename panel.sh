 IPADDR="$(curl -4skL http://ipinfo.io/ip)"    
    echo -e "—————————————— Select Websocket Protocol——————————————"""
    echo -e "${Green}1.${Font}  SSH Websocket"
    echo -e "${Green}2.${Font}  OVPN Websocket"
    
read -rp "Please Select a Protocol：" menu_num2
    case $menu_num2 in
    1)
	type_1="ssh"
	;;
    2)
	type_1="ovpn"
	;;
    *)
        echo -e "${RedBG}Please enter the correct number ${Font}"
	exit
        ;;
    esac
apt-get install sudo
sudo apt-get install mariadb-server

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
	db_root_password="bjhsL212MmhlWDRvWUxRaWY4YTdVQT09"
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
db_flagt="$(curl -4skL http://ipinfo.io/country)"
y=${db_flagt,,}
ws_dns=$(cat /etc/dnsinfo/ws.txt)
ssh_dns=$(cat /etc/dnsinfo/cdn.txt)
sdns_ns=$(cat /etc/dnsinfo/ns.txt)
sdns_pubkey=$(cat /etc/dnsinfo/publickey.txt)
country_name="$(curl -4skL http://api.ipstack.com/$(curl -s https://ipinfo.io/ip)?access_key=acdefdfb4ea065c16ec65196e432edf0 | jq -r '.country_name')"

    echo -e "—————————————— Select VPN Panel ——————————————"""
    echo -e "${Yellow}1.${Font}  XAMJYSSVPN"
    echo -e "${Green}2.${Font}  MaritesVPN \n"
    
read -rp "Please select VPN Panel：" Panel
    case $Panel in
    1)
	mysql -unew -pnew!@#$% -h142.44.136.130 -e"USE new
	INSERT INTO servers (host, host_address, type, category, ws_dns, hostname, sdns_ns, sdns_pubkey, validity, max_user, root_password, location, flag) VALUES ('$country_name $db_hostname', '$IPADDR', '$type_1', '$db_category', '$ws_dns', '$ssh_dns', '$sdns_ns', '$sdns_pubkey', '$valid', '$max', '$db_root_password', '$db_location', '$y');"
	;;
    2)
	mysql -umarites -pRz8nRMEBpKhC74eS -h142.44.136.130 -e"USE marites
	INSERT INTO servers (host, host_address, type, category, ws_dns, hostname, sdns_ns, sdns_pubkey, validity, max_user, root_password, location, flag) VALUES ('$country_name $db_hostname', '$IPADDR', '$type_1', '$db_category', '$ws_dns', '$ssh_dns', '$sdns_ns', '$sdns_pubkey', '$valid', '$max', '$db_root_password', '$db_location', '$y');"
	
	;;
    *)
        echo -e "${RedBG}Please enter the correct number ${Font}"
        ;;
    esac

	
exit
