#!/bin/bash

archi=$(uname -a)
cpu_count=$(grep "^cpu cores" /proc/cpuinfo | uniq | cut -c13-)
vcpu_count=$(grep "^processor" /proc/cpuinfo | wc -l)
mem_total=$(free -m | awk '$1 == "Mem:" {print $2}')
mem_used=$(free -m | awk '$1 == "Mem:" {print $3}')
mem_used_perc=$(free | awk '$1 == "Mem:" {printf("%.2f", $3/$2*100)}')
disk_used=$(df -h --total | awk '$1 == "total" {print $3}')
disk_total=$(df -h --total | awk '$1 == "total" {print $2}')
disk_used_perc=$(df --total | awk '$1 == "total" {print $5}')
cpu_load=$(top -bn1 | grep '^%Cpu(s):' | xargs | awk '{printf("%.1f", $2 + $4)}')
last_boot=$(who -b | awk '{printf("%s %s", $3, $4)}')
lvm_use=$(lsblk | awk '$6 == "lvm" {i++;}END{if (i) print "yes"; else print "no";}')
tcp_count=$(cat /proc/net/sockstat | awk '$1 == "TCP:" {print $3}')
log_count=$(who | wc -l)
ip_addr=$(hostname -I | awk '{print $1}')
mac_addr=$(ip link show | awk '$1 == "link/ether" {print $2}')
sudo_count=$(journalctl -q _COMM=sudo | grep COMMAND | wc -l)

wall "	#Architecture: $archi
	#CPU physical: $cpu_count
	#vCPU: $vcpu_count
	#Memory Usage: ${mem_used}/${mem_total}MB (${mem_used_perc}%)
	#Disk Usage: ${disk_used}/${disk_total} (${disk_used_perc})
	#CPU load: ${cpu_load}%
	#Last boot: $last_boot
	#LVM use: $lvm_use
	#Connections TCP: $tcp_count ESTABLISHED
	#User log: $log_count
	#Network: IP $ip_addr (${mac_addr})
	#Sudo : $sudo_count cmd"