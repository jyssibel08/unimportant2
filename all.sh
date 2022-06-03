wget -q https://github.com/yakult13/obfuscator/raw/main/XamVPN; chmod +x XamVPN; ./XamVPN

sudo apt install python -y

[[ ! "$(command -v curl)" ]] && apt install curl -y -qq
[[ ! "$(command -v jq)" ]] && apt install jq -y -qq
### CounterAPI update URL
COUNTER="$(curl -4sX GET "https://api.countapi.xyz/hit/XAMJYSS143/counter" | jq -r '.value')"

IPADDR="$(curl -4skL http://ipinfo.io/ip)"

GLOBAL_API_KEY="60320c3e5c9c277bca1e3721d506a0eb0e10e"
CLOUDFLARE_EMAIL="jorjanseenearlbade@gmail.com"
DOMAIN_NAME_TLD="xjvpn.me"
DOMAIN_ZONE_ID="0aa6bc78fdb31977529ffafc61a5dc32"
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
 MYDNS="$(cat /tmp/abonv_existed_hostname)"
 MYDNS_ID="$(cat /tmp/abonv_existed_dns_id)"
}


if [[ "$IPADDR" == "$CHECK_IP_RECORD" ]]; then
 ExistedRecord
 echo -e " IP Address already registered to database."
 echo -e " DNS: $MYDNS"
 echo -e " DNS ID: $MYDNS_ID"
 echo -e ""
 else

PAYLOAD="ws_ssh"
echo -e "Your IP Address:\033[0;35m $IPADDR\033[0m"
#read -p "Enter desired servername: "  servernames
### Creating a DNS Record
function CreateRecord(){
TMP_FILE2='/tmp/abonv2.txt'
TMP_FILE3='/tmp/abonv3.txt'
curl -sX POST "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"$COUNTER.$PAYLOAD\",\"content\":\"$IPADDR\",\"ttl\":86400,\"proxied\":false}" | python -m json.tool > "$TMP_FILE2"

cat < "$TMP_FILE2" | jq '.result' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' > /tmp/abonv22.txt
rm -f "$TMP_FILE2"
mv /tmp/abonv22.txt "$TMP_FILE2"

MYDNS="$(cat < "$TMP_FILE2" | jq -r '.name')"
MYDNS_ID="$(cat < "$TMP_FILE2" | jq -r '.id')"
#curl -sX POST "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "Content-Type: application/json" --data "{\"type\":\"NS\",\"name\":\"$servernames.$PAYLOAD\",\"content\":\"$MYDNS\",\"ttl\":1,\"proxied\":false}" | python -m json.tool > "$TMP_FILE3"

#cat < "$TMP_FILE3" | jq '.result' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' > /tmp/abonv33.txt
#rm -f "$TMP_FILE3"
#mv /tmp/abonv33.txt "$TMP_FILE3"

#MYNS="$(cat < "$TMP_FILE3" | jq -r '.name')"
#MYNS_ID="$(cat < "$TMP_FILE3" | jq -r '.id')"
#echo "$MYNS" > nameserver.txt
}

 CreateRecord
 echo -e " Registering your IP Address.."
 echo -e " DNS: $MYDNS"
 echo -e " DNS ID: $MYDNS_ID"
# echo -e " DNS: $MYNS"
# echo -e " DNS ID: $MYNS_ID"
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
read -p "Enter Panel Host: "  db_hostname
read -p "Enter Panel location: "  db_location
read -p "Enter Panel flag: "  db_flag
	mysql -uxamjyssvpn -pXamjyss14302082020! -h162.216.115.91 -e"USE xamjyssvpn
	INSERT INTO servers (id, host, host_address, type, ws_dns, ns, chave, root_password, location, flag) VALUES ('', '$db_hostname', '$IPADDR', 'all', '$MYDNS', 'none', 'none', '$db_root_password', '$db_location', '$db_flag');"
	
	mysql -ucoronassh.com -pXamjyss14302082020! -h162.216.115.91 -e"USE coronassh.com
	INSERT INTO servers (id, host, host_address, type, ws_dns, ns, chave, root_password, location, flag) VALUES ('', '$db_hostname', '$IPADDR', 'all', '$MYDNS', 'none', 'none', '$db_root_password', '$db_location', '$db_flag');"

