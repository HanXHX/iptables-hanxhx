TODO List
=========


Global
------
* Rewrite readme.md
* Save sysctl currents option before /etc/init.d/firewall and restore them at /etc/init.d/firewall
* Don't allow "start firewall" if it's started
* Output Rules (don't allow all output)
* Don't create "portscan_drop" and "invalid_drop" chains if not needed
* Debian packaging
* Create manpage/doc
* Provide skeleton for custom scripts
  * use "source /etc/firewall/includes"
* Syntax check of custom scripts before start
* Separate init.d script and firewall script
* Fast reload feature (use iptables-restore)

IPv6
----

* Same feature as IPv4

