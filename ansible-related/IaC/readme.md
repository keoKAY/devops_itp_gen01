## NOTE 

Use ansible controller in order to create or setup infrastructure on cloud or VM

-> Ansible -> Vagrant -> Manage VMs 
-> Ansible -> Cloud ( GCP, DO, AWS , ... )
> Terraform 


*** 
## Task01 
- create gcp instance using ansible playbook 
- destroy gcp instance 

## Task02 
- create gcp instances 
- generate inventory 
- run series of taskss on newly created infrastructure 



*** 
Way to authenticate yourself from playbooks 
- serviceaccount -> key.json 
- wif -> for production 
- adc -> application default credentials 


```bash 
gcloud auth login 
gcloud auth application-default login 