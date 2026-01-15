#!/bin/bash

# textblock 
cat << EOF > nginx-config.conf 
    server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend_server_ip:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}

EOF

echo "
this is the the second type of configuration 
Another style of swriting config file 
" | tee -a second-conf.conf 

tee third-conf.conf > /dev/null << EOF
This is first line.
This is second line.
This is third line.
EOF
