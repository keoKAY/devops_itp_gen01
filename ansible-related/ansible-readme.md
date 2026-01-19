## NOTE     
Working with ansible   


```bash 
ansible -i inventory.ini localhost -m ping

ansible-playbook -i inventory.ini playbooks/install-common-service.yaml --ask-become-pass 

# --ask-become-pass : when your machine ask for sudoer password 
```