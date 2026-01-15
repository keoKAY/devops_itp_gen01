ARG VERSION=1.22.1
FROM nginx:${VERSION}

WORKDIR /app
ADD https://i.pinimg.com/236x/c6/7d/dc/c67ddc2666a5683a7cab828a828f33ac.jpg . 

WORKDIR /usr/share/nginx/html
ARG NUM=1
COPY ./nginx-${NUM}/index.html ./index.html 
ENTRYPOINT ["nginx", "-g", "daemon off;"]