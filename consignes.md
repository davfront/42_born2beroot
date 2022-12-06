# Born2beroot - Consignes

## **Installer un serveur**
- utiliser virtualbox (sinon UTM)
- rendre uniquement un fichier signature.txt à la racine de votre dépôt
- intsaller le minimum de services
- pas d'interface graphique
- Debian (recommandé) ou CentOS
- minimum 2 partitions chiffrées en utilisant LVM

A connaître :
- différence entre apt et aptitude
- SELInux
- AppArmor

## **Serveur SSH**
- serveur actif sur le port 4242
- pas de connexion autorisée avec l'utilisateur root

A connaître :
- comprendre comment fonctionne le service
- installer un nouveau compte

## **Pare-feu UFW**
- ne laisser ouvert que le port 4242
- pare-feu actif au lancement de la VM

## **Utilisateurs**
- hostname: `<login>42`
- politique de mot de passe fort *(1)*
- installer et configurer sudo selon une pratique stricte *(2)*
- utilisateur nommé `<login>`, groupes: `user42`, `sudo` 

A connaître :
- créer utilisateur
- assigner groupe

###  *(1) Politique de mot de passe fort*
- expire tous les 30 jours
- 2 jours min avant modification
- avertissement 7 jours avant expiration
- 10 caractères minimums
- 1 majuscule
- 1 chiffre
- pas plus de 3 caractères identiques consécutifs
- ne contient pas le user name
- **user root:**
    - mêmes règles 
    - 7 caractères min qui ne sont pas présents dans l’ancien mot de
passe

###  *(2) Configuration stricte du groupe `sudo`*
- 3 essais max en cas de mot de passe erroné
- message d’erreur suite à un mauvais mot de passe lors de l’utilisation de sudo
- actions utilisant sudo archivées (inputs et outputs)
- log dans le dossier `/var/log/sudo/`
- mode TTY activé
- paths utilisables par sudo restreints, exemple :
`/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`

## **Script `monitoring.sh`**
- développer en bash
- dès le lancement du serveur, le script écrit toutes les 10min sur tous les terminaux (cf. `wall`), bannière facultative

Informations affichées:
- L’architecture de votre système d’exploitation ainsi que sa version de kernel.
- Le nombre de processeurs physiques.
- Le nombre de processeurs virtuels.
- La mémoire vive disponible actuelle sur votre serveur ainsi que son taux d’utilisation sous forme de pourcentage.
- La mémoire disponible actuelle sur votre serveur ainsi que son taux d’utilisation
sous forme de pourcentage.
- Le taux d’utilisation actuel de vos processeurs sous forme de pourcentage.
- La date et l’heure du dernier redémarrage.
- Si LVM est actif ou pas.
- Le nombre de connexions actives.
- Le nombre d’utilisateurs utilisant le serveur.
- L’adresse IPv4 de votre serveur, ainsi que son adresse MAC (Media Access Control).
- Le nombre de commande executées avec le programme sudo.

A connaître :
- focntionnement du script
- savoir interrompre son exécution sans le modifier (cf. `cron`)