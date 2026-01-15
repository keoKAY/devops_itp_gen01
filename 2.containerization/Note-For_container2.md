## NOTE for the container part II 


### Reviews 
```bash

docker build -t image-name:tag . 
docker build -t image-name:tag -f filename.Dockerfile  . 

docker run -dp host-port:container-port \   
    --name container_name \
    image-name:tag 

docker ps 
docker container ls 
docker images 
docker volume ls 
docker network ls 
docker exec -it container_name /bin/bash # shell 
```

### Building the docker images
- ReactJs 
- SpringBoot with gradle 

```bash
git clone https://github.com/keoKAY/reactjs-devop8-template.git \
    reactjs-image-demo 


# build image 
docker build -t multi-stage-reactjs \
    -f dev.Dockerfile  .

# run as container 
docker run -dp 3001:8080 --name reactjs \
    multi-stage-reactjs:latest 


docker volume ls 
docker volume inspect vol-name
# mountpoint = location that stored on the machine 


# using volume with container 
docker volume create vol-name 
docker run -dp 3000:80 \
    -v vol-name:container-path  image 

docker run \
    --mount type=volume,source=vol-name,target=container-apth image 

```

- Building docker image for spring boot services
```bash 
git clone https://gitlab.com/devops-trainings3/special-trainning/sample-projects/simple-fileupload-gradle.git spring-file-upload 

cd spring-file-upload

docker build -t spring-fileupload -f dev.Dockerfile .
docker build -t spring-fileupload \
    --build-arg PORT=9090 \
    --build-arg GRADLE_VERSION=latest \
    -f dev.Dockerfile .


docker run -dp 8082:8080 \
    --name file-upload-cont spring-fileupload 


# -f follow 
docker logs -f container-name| container-id 
docker exec -it container-name /bin/bash 
# /app/filestorage/images  : is the location store images  
docker volume create spring-files
docker run -dp 8082:8080 \
    -v spring-files:/app/filestorage/images \
    --name file-upload-cont spring-fileupload 

# working with bindmount 
docker run -dp 8082:8080 \
    --mount type=bind,source=./spring-files,target=/app/filestorage/images \
    --name file-upload-cont spring-fileupload 


docker inspect file-upload-cont 
docker image inspect spring-fileupload

```

## Docker netowork 
```bash
docker run -dp 80:80 --name nginx nginx:alpine 
# run container inside the host network interface 
docker run -d --network host --name nginx nginx:alpine 


# Testing custom bridge network 
docker network create demo2-network -d bridge 
docker run -it --rm --name container1 \
    --network demo2-network \
    busybox:latest

docker run -it --rm --name container2 busybox:latest 
# run this command 
# to join the container2 into the docker network called demo2-network 
docker network connect demo2-network container2 




docker compose config 
docker compose config --services # look at your services 
docker compose up -d # up , build , all services 

```