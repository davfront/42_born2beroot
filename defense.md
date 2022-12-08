## Preliminaries

Clone VM from `/sgoinfre/Perso/dapereir/`

## General instructions
Compare signatures:
```
cat signature.txt
```
```
shasum /sgoinfre/Perso/dapereir/born2beroot_sgoinfre/born2beroot_sgoinfre.vdi
```

## Mandatory Part

### Project overview

Explications:
- [ ] Fonctionnement de la VM
- [ ] Choix de Debian
- [ ] Différences entre Debian et Centos
- [ ] Différence entre apt et aptitude
- [ ] AppArmor


### Simple setup

```
sudo ufw status
sudo service ssh status
cat /etc/os-release
```

### User

```
groups dapereir
getent group sudo
```

```
sudo adduser pseudo                     # add user
sudo groupadd evaluating                # create group
sudo usermod -aG evaluating pseudo      # assign user to group
getent group evaluating                 # check members of group
```

```
sudo passwd pseudo                      # change password
sudo userdel -r pseudo                  # delete user
```
