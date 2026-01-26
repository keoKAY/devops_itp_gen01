## NOTE for working with ansible vault 


```bash 
ansible-vault --help

ansible-vault encrypt filename.yaml 


ansible-playbook .... --ask-vault-pass 
ansible-playbook .... --vault-password-file file.txt 

```
- `ansible-vault rekey filename`: Used in order to  change the vault password, but also required you to remember the old one before changing the new one. 