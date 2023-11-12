#! /bin/bash
# Designed to find hosts with MySQL installed

nmap -sT 192.168.100.255 -p 5432 >/dev/null -oG MySQLscan

cat MySQLscan | grep open > MySQLscan2

cat MySQLscan2
