isc-bind9-dyndns-updater
=============

- These scripts are extracted from SAMBA official [wiki](https://wiki.samba.org/index.php/Configure_DHCP_to_update_DNS_records_with_BIND9). 
- These scripts were utilized for tweaking a local test [Univention Corporate Server (UCS)](https://www.univention.com/products/ucs/).
- If successful, DHCP clients should have their DNS records in Bind9 DNS.

#### To Setup
1. Login to the DHCP+DNS server (the UCS Domain Controller Master)
	- assuming to be **root** user.
2. Create a `domain.name` file, or manually edit the `01_setup_updater_user.sh` file.
	- with only one line of the desired domain name.
	- in the form of `DOMAIN.LAN`.
3. Run `01_setup_updater_user.sh`.
4. Run `02_copy_updater_script.sh`.
5. Run `03_copy_dyndns_conf.sh`.
6. Run `04_update_dhcpd_conf.sh`.
	- The `/etc/dhcp/dhcpd.conf` file is managed by UCS, this update may need to be applied again if UCS does removed the `include "/etc/dhcp/dhcp-dyndns.conf";` line. 
7. Reboot (or restart all services).
