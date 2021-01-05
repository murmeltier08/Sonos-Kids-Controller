# Sonos-Kids-Controller Docker 
Refer to https://github.com/Thyraz/Sonos-Kids-Controller for all the configuration detail.
You need to define the config.json for the /Sonos-Kids-Controller-master/server/config/ 

```
{
    "node-sonos-http-api": {
        "server": "127.0.0.1",
        "port": "5005",
        "rooms": [
            "Livingroom",
            "Kitchen"
        ]
    },
    "spotify": {
        "clientId": "your_id",
        "clientSecret": "your_secret"
    }
}
```
The data.json will also stored in the volume. 
So you will store your artist/albums after restart of the container.
You need to open Port 8200

#  Example
## Recommended Version: stable-v1

Supported architectures: 

[Linux/ARM/V6](https://hub.docker.com/layers/murmeltier08/sonos-kids-controller/latest/images/sha256-c5d9da532b39b3886078d871f43c76aba6ad844b39ef164cf9e3ba7a93c3eef4?context=explore)
[Linux/AMD64](https://hub.docker.com/layers/murmeltier08/sonos-kids-controller/latest/images/sha256-68bb565656f64c9a1dbfd5edd527804403fad5c15f049a62ac5ee1a5340f33bf?context=explore)



## Code to run container
Tested with Docker Desktop for Mac x64 
```
 docker run -p 8200:8200 -v /your/local/path/for/config:/Sonos-Kids-Controller-master/server/config/ murmeltier08/sonos-kids-controller:stable-v1
```
## Docker compose


```
version: "3"
networks:
  outside:
    external:
      name: "yournetwork"
services:
  sonoskids:
    image: sonoskids:stable-v1
    restart: always
    ports:
      - 8200:8200
    volumes:
       - /docker/sonoskids/config:/Sonos-Kids-Controller-master/server/config/
    networks:
      - outside
```


# Documentation for me ;)
## Create image for docker Hub with Mac x64 for ARM
https://www.docker.com/blog/multi-arch-images/

```
docker buildx use mybuilder
docker buildx inspect --bootstrap
```
push to github / docke hub
```
docker buildx build --platform linux/amd64,linux/arm/v6 -t murmeltier08/sonos-kids-controller:latest --push .
```
## Create image with Raspberry PI

1. Create dir e.g. docker/test in your @RaspberryPI
2. Download Repo from git
```
cd /docker/test/
sudo wget https://github.com/Thyraz/Sonos-Kids-Controller/archive/master.zip
sudo unzip master.zip
```
3. Create a Dockefile in /docker/test/Dockerfile
```
FROM node:15-alpine
# debug could not get uid/gid error.
RUN npm config set unsafe-perm true
RUN npm install -g @ionic/cli
RUN wget https://github.com/Thyraz/Sonos-Kids-Controller/archive/master.zip
RUN unzip master.zip
RUN rm master.zip
WORKDIR /Sonos-Kids-Controller-master
VOLUME /Sonos-Kids-Controller-master/server/config
RUN npm install
RUN ionic build --prod
ADD ./Sonos-Kids-Controller-master/server/config/config-example.json ./Sonos-Kids-Controller-master/server/config/config.json
EXPOSE 8200
CMD npm start
```
4. Create image
Name e.g. sonoskids 
```
sudo docker build -t sonoskids . -f  /docker/test/Dockerfile
```
5. docker compose for Portainer

Check under "images" in Portainer the image with name "sonoskids" exist.
```
version: "3"
networks:
  outside:
    external:
      name: "yournetwork"
services:
  sonoskids:
    image: sonoskids:latest
    restart: always
    ports:
      - 8200:8200
    volumes:
       - /docker/sonoskids/config:/Sonos-Kids-Controller-master/server/config/
    networks:
      - outside
```
