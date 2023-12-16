#! /bin/bash
# Designed to find hosts with MySQL installed

nmap -sT 127.0.0.1 -p 5432 >/dev/null -oG MySQLscan

cat MySQLscan | grep open > MySQLscan2

cat MySQLscan2
