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
So you will have your artist/albums after restart of the container.
You need to open Port 8200

# Example code
Tested with Docker Desktop for Mac x64 
```
 docker run -p 8200:8200 -v /your/local/path/for/config:/Sonos-Kids-Controller-master/server/config/ murmeltier08/sonos-kids-controller 
```
# Create image at Raspberry PI - experimential 

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
