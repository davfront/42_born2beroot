# Born2beroot - Notes

LVM = Logical Volume Manager
\
APT = Advanced Packaging Tool

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
vim /etc/ssh/ssh_config
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

## **User management**

## **Script**

