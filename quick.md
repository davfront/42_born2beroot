# Born2beroot - Quick


## **Virtual machine**

1. [ISO](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.5.0-amd64-netinst.iso)

2. Create the Virtual Machine
	- Open VirtualBox > New (name: `born2beroot`, use defaults)
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
		- Encryption passphrase: `Leporcestdanslaporcherie.2`
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
	- Login (`dapereir`) / Password (`MDP4Myself`)

Summary:
- Encryption passphrase: `Leporcestdanslaporcherie.2`
- hostname: `dapereir42`
- root password: `MDP4TheBoss`
- user: `dapereir`
- user password: `MDP4Myself`

## **Install sudo**

Login as root
```
su -
```

Install sudo
```
apt update
apt upgrade
apt install sudo
```

Add user to sudo group
```
usermod -aG sudo dapereir
```

## **Install vim**

```
sudo apt install vim
```


## **SSH server**

```
sudo apt install openssh-server
```

Change the default port to 4242 (then restart the service)
```
sudo vim /etc/ssh/sshd_config
```

## **UFW firewall**

```
sudo apt install ufw
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 4242
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

4. Check SSH status
	```
	sudo service sshd status
	```

4. Open a connection from Host
	```
	ssh dapereir@127.0.0.1 -p 4242
	```

4. Close connection
	```
	exit
	```

## **User management**

## **Script**

