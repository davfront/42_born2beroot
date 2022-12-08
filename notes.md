# Born2beroot - Notes

LVM = Logical Volume Manager
\
APT = Advanced Packaging Tool
\
UFW = Uncomplicated Firewall
\
SSH = Secure Shell (ssh = client, sshd = server)

**Differences between `apt` and `aptitude`**
> Both are tools that interact with APT and allow you to install, remove and manage packages in Debian based Linux distributions.
\
`apt-get` is one such command-line tool which is widely popular.
\
Another popular tool is `Aptitude` with both GUI and command-line options.

**Differences between `apt` and `apt-get`**

> `apt commands` = most common used command options from `apt-get` and `apt-cache`
\
Complete Article: [Click here](https://itsfoss.com/apt-vs-apt-get-difference/)


## **Virtual machine**

1. Download [Debian ISO](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.5.0-amd64-netinst.iso) (Website: [debian.org/download](https://wwww.debian.org/download))

2. Create the Virtual Machine
	- Open VirtualBox 
	- New (use defaults)
	- Settings > Storage > IDE > Select the debian ISO

4. Start Debian installation
	- Start
	- Choose the Debian Image
	- Select: `Install`

5. Configure Debian
	- General
		- Language: `English`
		- Country: `Other` > `Europe` > `France`
		- Locales: `en_US.UTF-8`, US Keyboard
	- Network
		- hostname: `dapereir42`
		- domain name: `<blank>`
	- Users
		- root password: `MDP4TheBoss`
		- add user: `dapereir` (fullname and username)
		- user password: `MDP4Myself`
	- Partitions
		- Select: `Guided - use entire disk and set up encrypted LVM`
		- Select the only disk
		- Select: `Separate /home, /var, and /tmp partitions`
		- `Yes`
		- `Cancel`
		- Encryption passphrase: `Le_porc_est_dans_la_!wait4it!_porcherie`
		- Amount of volume: `max`
		- `Finish partitioning ...`
		- `Yes`
	- Package manager
		- Scan extra media: `No`
		- Mirror country: `France`
		- Mirror: `deb.debian.org` (default)
		- HTTP Proxy: `<blank>`
		- Participate in teh usage survey: `No`
		- Software to install: `<Deselect all>` (use spacebar)
	- GRUB boot loader
		- Install: `Yes`
		- Device for boot loader installation: `/dev/sda` (Debian ISO)
		- `Continue`

6. Reboot and login
	- Select `Debian GNU/Linux` (or wait...)
	- Encryption passphrase
	- Login (`dapereir`) / Password

Tips:
-  Release Virtualbox capture: `Ctrl` + `Alt` + `Win`

Summary:
- Encryption passphrase: `Le_porc_est_dans_la_!wait4it!_porcherie`
- hostname: `dapereir42`
- root password: `MDP4TheBoss`
- user: `dapereir`
- user password: `MDP4Myself`

## **Install sudo**

Login as root (use `-` to land into the root directory)
```
su -
```

Login as user (use `-` to land into the user home directory)
```
su - username
```

Leave root
```
exit
```

Update APT database
```
apt update
```

Update APT packages versions
```
apt upgrade
```

Install sudo
```
apt install sudo
```

Open sudoers file
```
visudo
```

## **Manage users and groups**

### **Users**

Create a user
```
adduser username
```

Assign a password to a user
```
passwd username
```

Accessing a user configuration file
```
cat /etc/passwd
```

Delete a user (you need to delete the user from the groups)
```
userdel -r username
```

List all users
```
getent passwd
```

### **Groups**

List all members of a group
```
getent group groupname
```

List all groups of the system
```
getent group
```

or
```
cat /etc/group
```

Print the first field
```
getent group | awk -F: '{ print $1 }'
```



### **Users and groups**

Add user in a group
```
usermod -aG groupname username
```

Add user in mutiple groups
```
usermod -aG group1,group2,group3 username
```

Change user primary group
```
usermod -g groupname username
```

List the groups of the current user
```
groups
```

List the groups of a user
```
groups username
```

List the groups with their numerical ids of the current user
```
id
```

List the groups with their numerical ids of a user
```
id username
```




## **SSH server**

Install SSH
```
apt install openssh-server
```

Check the SSH server status
```
systemclt status ssh
```

Stop the service SSH
```
service ssh stop
```

Restart the service SSH
```
service ssh restart
```

Change the default port to 4242 (then restart the service)
```
vim /etc/ssh/sshd_config
```


## **UFW firewall**

Install UFW
```
apt install ufw
```

Enable UFW
```
ufw enable
```

Ckeck status
```
ufw status numbered
```

Configure the rules
```
ufw allow ssh
```

Configure the port rules
```
ufw allow 4242
```

Delete rule (for defense)
```
ufw status numbered
ufw delete <number>
```

## **Connecting SSH Server**

1. Go to VirtualBox > Choose the VM > Select Settings

2. Choose `Network` > `Adapter 1` > `Advanced` > `Port Forwarding` > Plus

3. Enter values:
	- Host port: 4242
	- Guest Port: 4242

4. Restart SSH server in VM
	```
	sudo systemctl restart ssh
	```

5. Check SSH status
	```
	sudo service sshd status
	```

6. Open a connection from Host
	```
	ssh dapereir@127.0.0.1 -p 4242
	```

7. Close connection
	```
	exit
	```

## **Password policy**

[How To Set Password Policies In Linux](https://ostechnix.com/how-to-set-password-policies-in-linux/)

[libpam-pwquality](https://debian-facile.org/doc:securite:passwd:libpam-pwquality)

Politique de mot de passe fort:
- [x] expire tous les 30 jours
- [x] 2 jours min avant modification
- [x] avertissement 7 jours avant expiration
- [x] 10 caractères minimums
- [x] 1 majuscule
- [x] 1 chiffre
- [x] pas plus de 3 caractères identiques consécutifs
- [x] ne contient pas le user name
- [x] 7 caractères min qui ne sont pas présents dans l’ancien mot de
passe (ne s'applique pas à root)
- [x] user root: mêmes règles 

### **Password complexity**

Install quality checking:
```
sudo apt install libpam-pwquality
```

Edit file:
```
sudo vim /etc/pam.d/common-password
```

Add after `pam_pwquality.so`:
```
retry=3 minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=1 difok=7 enforce_for_root
```

| option             | description                                                          |
| ------------------ | -------------------------------------------------------------------- |
| `minlen=10`        | 10 caractères minimums                                               |
| `ucredit=-1`       | 1 majuscule                                                          |
| `dcredit=-1`       | 1 chiffre                                                            |
| `maxrepeat=3`      | pas plus de 3 caractères identiques consécutifs                      |
| `usercheck=1`      | ne contient pas le user name                                         |
| `difok=7`          | 7 caractères min qui ne sont pas présents dans l’ancien mot de passe |
| `enforce_for_root` | mêmes règles pour le root                                            |

NB: `difok` ne s'applique pas au root.


### **Password expiration**

Edit file:
```
sudo vim /etc/login.defs
```

Change (30 days max, 2 days min before change, warn 7 days before expiration):
```
PASS_MAX_DAYS	30
PASS_MIN_DAYS	2
PASS_WARN_AGE	7
```

Reboot:
```
sudo reboot
```


### **Group**

```
sudo groupadd user42
sudo usermod -aG user42 dapereir
```

### **Sudoers group**

Edit `/etc/sudoers` with `visudo` (syntax checked) :
```
sudo visudo
```

Add options:
```
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
Defaults        passwd_tries=3
Defaults        badpass_message="WRONG!!! Try again :)"
Defaults        logfile="/var/log/sudo/sudo.log"
Defaults        log_input,log_output
Defaults        requiretty
```

Create the log file:
```
su -
touch /var/log/sudo/sudo.log
```


### **Script**

Create `monitoring.sh` file:
```
archi=$(uname -a)
cpu_count=$(grep "^cpu cores" /proc/cpuinfo | uniq | cut -c13-)
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
```

Edit permissions:
```
sudo chmod +x monitoring.sh
```

Install cron:
```
sudo apt install cron
```

Configure `cron` as root:
```
sudo crontab -u root -e
```

Edit:
```
@reboot /etc/monitoring.sh
*/10 * * * * /etc/monitoring.sh
```

### **Signature**

Clone VM to `/sgoinfre/Perso/dapereir`

Run:
```
shasum /sgoinfre/Perso/dapereir/born2beroot_sgoinfre/born2beroot_sgoinfre.vdi
```

Copy the result in `signature.txt`