# Born2beroot - Notes

LVM = Logical Volume Manager

## **Virtual machine**

1. Download [Debian ISO](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.5.0-amd64-netinst.iso) (Website: [debian.org/download](https://wwww.debian.org/download))

2. Create the Virtual Machine
    - Open VirtualBox 
    - New (use defaults)
    - Settings > Storage > IDE > Select the debian ISO

4. Install Debian
    - Start
    - Choose the Debian Image
    - Select: `Install`
    - Configure:
        - General
            - Language: `English`
            - Country: `Other` > `Europe` > `France`
            - Locales: `en_US.UTF-8`, US Keyboard
        - Network
            - hostname: `dapereir42`
            - domain name: `<none>`
        - Users
            - root password: `MDP4TheBoss`
            - add user: `dapereir` (fullname and username)
            - user password: `MDP4Myself`
        - Partitions
            - Select: `Guided - use entire disk and set up encrypted LVM`
            - Select the only disk
            - Select: `Separate /home, /var, and /tmp partitions`
            - Yes
            - Cancel





## **SSH server**

## **UFW firewall**

## **User management**

## **Script**
