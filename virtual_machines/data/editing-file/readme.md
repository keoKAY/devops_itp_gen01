#  NOTE 

We are working with two different commands 
- sed
- yq 

ex. 
- inventory file 
- configuration ( nginx configurationi )
- values.yaml ( helm ) 
- .....


*** 
- working with sed command 
> **Regex**
`sed 's/pattern/new-value' filename.txt` 
> replace pattern with new-value 
`-i` : in place ( edit the actual file )
```bash
tldr sed
# to replace the text 
# -i inplace 
sed 's/"8080:80"/"9090:80"/' docker-compose.yml

sed '/image:/a \    environment:\n      - ENV=production' docker-compose.yml 

sed '/volumes:/,/^[^ ]/d' docker-compose.yml
```

## yq 

```bash 
yq '.services.react-cont' docker-compose.yml

yq '.services.react-cont.image = "react:v1.0.0"' \
    docker-compose.yml 

yq '.services.react-cont.ports[1]="9999:80"' \
    docker-compose.yml 

yq '.services.react-cont.ports=["1111:80","2222:80","3333:80"]' \
    docker-compose.yml 

# add environment
```