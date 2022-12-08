archi=$(uname -a)
cpu_count=$(grep "cpu cores" /proc/cpuinfo | uniq | cut -c13-)
vcpu_count=$(grep "^processor" /proc/cpuinfo | wc -l)
mem_total=$(free -m | grep Mem | awk '{print $2}')
mem_used=$(free -m | grep Mem | awk '{print $3}')
mem_used_perc=$(free | grep Mem | awk '{printf("%.2f", $3/$2*100)}')
disk_used=$(df | grep "^/dev/mapper/" | awk '{SUM+=$3}END{printf("%d", SUM/1024)}')
disk_total=$(df | grep "^/dev/mapper/" | awk '{SUM+=$2}END{printf("%d", SUM/1024/1024)}')
disk_used_perc=$(df | grep "^/dev/mapper/" | awk '{USED+=$3}{TOTAL+=$2}END{printf("%d", USED/TOTAL*100)}')
cpu_load=$(top -bn1 | grep '^%Cpu(s):' | cut -d: -f2 | xargs | awk '{printf("%.1f", $1 + $3)}')
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
	#Disk Usage: ${disk_used}/${disk_total}Gb (${disk_used_perc}%)
	#CPU load: ${cpu_load}%
	#Last boot: $last_boot
	#LVM use: $lvm_use
	#Connexions TCP: $tcp_count ESTABLISHED
	#User log: $log_count
	#Network: IP $ip_addr (${mac_addr})
	#Sudo : $sudo_count cmd"