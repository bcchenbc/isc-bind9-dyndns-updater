cp dhcp-dyndns.conf /etc/dhcp/dhcp-dyndns.conf
dnssec-keygen -a HMAC-MD5 -b 512 -n USER DHCP_OMAPI
DHCP_OMAPI_KEY=$(cat Kdhcp_omapi.+*.private | grep ^Key | cut -d ' ' -f2-)
sed -i -e "s|DHCP_OMAPI_KEY_HERE|$OKEY|" /etc/dhcp/dhcp-dyndns.conf
