# iptables-hanxhx
Easy and powerful iptables script

## What is this?
iptables-hanxhx is a set of predefined firewall rules. Now, you can use this script for "webhosts". I will work to have "generic" config for routers, laptop... etc.

#### iptables-hanxhx is tested on
* Debian 7.0 / Wheezy
* Ubuntu 12.10 / Quantal

#### iptables-hanxhx should work with
* Debian 6.0 / Squeeze
* Debian 8.0 / Jessie
* Ubuntu 10.04 LTS / Lucid
* Ubuntu 12.04 LTS / Precise
* Ubuntu 13.04 / Raring

#### Future platform to test
* Archlinux
* Gentoo
* Slackware


#### Features
* Rock solid defaults
* Easy extendable
* One-line opening ports
* One line whitelisting ips
* One line blacklisting ips
* Documented (inline comments)

## Installation

Create necessary directories first
    
    sudo mkdir /etc/firewall
    sudo mkdir /etc/firewall/custom

Checkout the github repo and install the files

    git clone https://github.com/HanXHX/iptables-hanxhx.git 
    cd iptables-hanxhx
    sudo cp firewall /etc/init.d/firewall
    cd etc/firewall/
    sudo cp *.conf /etc/firewall/
    
Make sure firewall is executable and update runnlevels

    sudo chmod 755 /etc/init.d/firewall
    sudo update-rc.d firewall defaults
    
## Configuration

All configuration-files are to be found at /etc/firewall/

Feel free to read the firewall-script itself and comment/uncomment what you like or dislike.

#### firewall.conf
Main firewall configfile. All settings are on sane defaults, you really should know what you do
if you change them.

#### services.conf
This file is used to open ports for services like ssh or http(s) in your firewall.

###### SYNTAX:

PORT/PROTOCOLL SOURCE
where SOURCE is the source ip or network

n.n.n.n/m - Where n.n.n.n is the IP address range and m is the bitmask.

if SOURCE is empty it defaults to 0.0.0.0/0 (which is any IP)

###### EXAMPLEs:

opens ports for SSH for IP 192.168.0.1:

    22/tcp 192.168.0.1
    22/udp 192.168.0.1

opens ports for HTTP for any IP

    80/tcp 0.0.0.0/0

opens ports for HTTPS for any IP

    443/tcp

#### ip-whitelist.conf:
Add all source IPs you want to have full access to this host.
One IP per line

###### SYNTAX:

n.n.n.n/m.m.m.m  - Where n.n.n.n is the IP address range and m.m.m.m is the netmask.

n.n.n.n/m - Where n.n.n.n is the IP address range and m is the bitmask.

###### EXAMPLEs:

    192.168.0.1
    192.168.1.0/8
    192.168.55.0/255.255.255.148
    
#### ip-blacklist.conf:
Add all source IPs you want to COMPLETELY BLOCK
One IP per line

###### SYNTAX:

n.n.n.n/m.m.m.m  - Where n.n.n.n is the IP address range and m.m.m.m is the netmask.

n.n.n.n/m - Where n.n.n.n is the IP address range and m is the bitmask.

###### EXAMPLEs:

    192.168.0.1
    192.168.1.0/8
    192.168.55.0/255.255.255.148
    
#### custom/*:
Every file/script you place here will be executed during firewall-start.
Place your custom rules in here.

There are some usefull examples in ./custom-examples/ that limit the ammount of new and overall connections.

## Usage
If you updated your runlevels, the firewall starts every time you boot your system.
However, you can manually start/stop/restart, e.g. to update changed settings.

    /etc/init.d/firewall (start|stop|restart|reload|force-reload|status)

* start: starts the firewall
* stop: stops the firewall
* restart, reload, force-reload: restarts the firewall (all three the same)
* status: print out the status of the firewall, shows all entries in iptables

## About Authors
This program is written by Emilien Mantel (http://www.debianiste.org).
This program is forked from iptables-boilerplate (https://github.com/bmaeser/iptables-boilerplate)
written by Bernhard Mäser (http://bmaeser.io).


## Licence
The MIT License (MIT)
Copyright © 2013 Emilien Mantel, http://www.debianiste.org
Copyright © 2012-2013 Bernhard Mäser, http://bmaeser.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

