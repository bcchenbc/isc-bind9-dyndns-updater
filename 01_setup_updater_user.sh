#!/bin/bash
DOMAINNAME=$(echo domain.name)    # read from file or manually update here

samba-tool user create dhcpupdater --description="Unprivileged user for TSIG-GSSAPI DNS updates via ISC DHCP server" --random-password

samba-tool user setexpiry dhcpupdater --noexpiry
samba-tool group addmembers DnsAdmins dhcpupdater

samba-tool domain exportkeytab --principal=dhcpupdater@$DOMAINNAME /etc/dhcpupdater.keytab

chown root:root  /etc/dhcpupdater.keytab
chmod 400  /etc/dhcpupdater.keytab
