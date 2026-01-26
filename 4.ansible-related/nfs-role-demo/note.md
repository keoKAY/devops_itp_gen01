## NOTE 

`apt-get update`
is the same as 
```yaml
apt: 
    update_cache: yes 
```
- if anything is off on the system(lock files, network hiccup, DNS issue, repo timeout , another apt process running), we will get 
> Failed to update apt cache: unknown reason

```yaml
apt:
  update_cache: yes
  cache_valid_time: 3600
```
You are telling Ansible 
> Only run `apt-get update` if the cache is olderr than 1 hour 
- Internally, ansible checks: 
    - Timestamp of /var/lib/apt/periodic/update-success-stamp 
    - if it's newer than 3600 seconds, Ansible skips `apt-get update`
    - No command -> no failure -> tasks succeeds 
> So instead of forcing an update, you get a conditional updates. 

### Why this fixes the failures 
Most real-world apt failures are temporary 
- another process apt holding a lock
- Slow or flaky network
- Repo mirror timeout 
- System just booted and cloud-init is still running 



### Better approach 
```yaml 
- name: Update apt cache
  apt:
    update_cache: yes
    cache_valid_time: 3600
  register: apt_update
  retries: 5
  delay: 10
  until: apt_update is succeeded

```

***
### Working with git modules 
               
```bash 
# because we already track the nfs folder inside the main repo
git rm -r 4.ansible-related/nfs-role-demo/roles/nfs
git rm --cached -r 4.ansible-related/nfs-role-demo/roles/nfs  
git restore nfs             
git submodule add https://github.com/keoKAY/ansible-nfs-role-itp 4.ansible-related/nfs-role-demo/roles/nfs  



```