### NOTE for docker 

What is container runtime ? 
Each level is optimized for different usage 
1. Low-level ex. cri-o : used in kubernetes
2. High-level -> ex. Container Engine : used docker 


Local machine of developers
Dev Server 
Test Server 
Prod Server 


Analogy 
Image is shippable 
Bundled , Packaged into a portable runtime environment = container 
Package ( src code, dependencies , configuration ... )

- To run docker without sudo 
```bash
sudo usermod -aG docker $USER 
newgrp docker 

# Test 
docker ps
docker run hello-world
docker version 


docker obj verb 
docker container ls
docker container ls -a 
docker ps 
docker ps -a 
 
docker image ls 
docker container prune 
```


## TEST 
1. Deploy Reactjs website on a server though port=3000
```bash

# pull image (download) to your machine 
docker pull 69966/earthdx:78 

# port must be unique 
# name must be unique 
docker run  -dp 3000:80 \
    --name reactjs-cont \
    69966/earthdx:78 

# if we want to deploy postgres database 
docker run -d -p 5432:5432 --name postgres-cont \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_USER=myuser \
    -e POSTGRES_DB=mydb \
    postgres

```

Bonus: 
1. Copy volume from one volume to another 


## Working with building customized images and registry 

- after having the nginx.Dockerfile 
```bash
# you will need to run this inside the location that you store the dockerfile 
docker build -t custom-nginx \
    -f nginx.Dockerfile .

docker build -t custom-nginx \
    --build-arg NUM=2 \
    --build-arg VERSION=latest \
    -f nginx.Dockerfile .

docker run -dp 3001:80 --name nginx-1 \
    custom-nginx 


docker exec -it nginx-1 /bin/bash
```