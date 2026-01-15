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

# delete user and also backup the user data to zipped folder 
sudo deluser \
    --backup-to /var/my_backup \
    --remove-home superman

```

## LAB Solutions 
```bash
sudo useradd -m -s /bin/bash username
# Setting default password 
echo "username:DefaultPassword123" | sudo chpasswd

# To force user to change password on first login 
sudo chage -d 0 username 
# -d 0 -> password last change = 0 -> force password change at next login 

# Set account expirations 
# format: yyyy-mm-dd
# example: Expires on 31 December 2025 
sudo chage -E 2025-12-31 username 
# to check the expiration 
sudo chage -l username 
```