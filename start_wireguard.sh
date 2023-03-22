#!/usr/bin/env bash
for conffile in /etc/wireguard/* ; do
	/usr/bin/wg-quick up $conffile
done
