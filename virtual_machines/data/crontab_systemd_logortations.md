## Notes 

1. Crontab 

```bash 
tldr crontab
contab -e # edit configuration of cront to create job 
crontab -l # list all jobs 

# list job of superman 
sudo crontab -u superman -l


# delete 
# delete all 
crontab -r -i 

```


### Systemd and service
```bash
service vs systemctl 

# command verb obj
systemctl status nginx 
systemctl start nginx 
systemctl stop nginx

systemctl enable nginx 
systemctl disable nginx
# hard refresh  
systemctl daemon-reload

# command obj verb 
service nginx status
service nginx restart  
```

* Deploy service with systemd 