#FROM balenalib/raspberry-pi-debian:latest-20201118
FROM node:15-alpine
#INSTALL old 
#RUN apt-get update
#RUN apt-get install npm
#RUN apt-get install wget
RUN npm config set unsafe-perm true
RUN npm install -g @ionic/cli
#RUN apt-get install unzip
# debug could not get uid/gid error.
RUN wget https://github.com/Thyraz/Sonos-Kids-Controller/archive/master.zip
RUN unzip master.zip
RUN rm master.zip 
WORKDIR /Sonos-Kids-Controller-master
ADD ./src ./www
RUN npm install ionic build --prod
ADD ./server/config/config-example.json ./server/config/config.json
#VOLUME /Sonos-Kids-Controller-master/server/config
EXPOSE 8200
#RUN /bin/bash
CMD npm start
#RUN sudo npm install pm2 -g

#RUN pm2 startup
#RUN WORKDIR /Sonos-Kids-Controller-master
#RUN pm2 start server.js
#RUN pm2 save