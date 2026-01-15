## NOTE 

```bash 
sudo chown username folder 
sudo chown username:group folder 

# change recursively ( nested folder )
sudo chown -R .....

# to change only the grojp of the folder
chgrp vagrant testingfile1.txt
# to create a symlink for all_config to service_a
ln -s ~/all_config/config.cfg ~/service_a/



# modify the sudoer privileges 
sudo visudo 


# to configure per file editor
sudo EDITOR=vim visudo

# to set the VIM as editor for all file operations
sudo export EDITOR=vim 
sudo visudo 

```