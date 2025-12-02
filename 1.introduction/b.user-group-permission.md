# NOTE related to user , group and permissions 

There are three type of users : 
1. Root User 
2. System User 
3. Regular User

```bash

useradd username 
adduser username 
tldr useradd|adduser 


su - username # fresh login 
su username # keep context 


# to change the password of the user and other user 
passwd 
sudo passwd username 

sudo deluser --backup-to /var/my_backup --remove-home superman

```