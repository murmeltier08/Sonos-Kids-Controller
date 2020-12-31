RUN apt-get update
FROM balenalib/raspberry-pi-debian:latest-20201118
#INSTALL  
RUN apt-get install npm
RUN apt-get install wget
RUN apt-get install unzip
# debug could not get uid/gid error.
RUN npm config set unsafe-perm true
RUN npm install -g @ionic/cli
RUN wget https://github.com/Thyraz/Sonos-Kids-Controller/archive/master.zip
RUN unzip master.zip
RUN rm master.zip 
WORKDIR /Sonos-Kids-Controller-master
RUN npm install ionic build --prod
ADD ./server/config/config-example.json ./server/config/config.json
VOLUME ./server/config
EXPOSE 8200
#RUN /bin/bash
#RUN npm start
#RUN sudo npm install pm2 -g

#RUN pm2 startup
#RUN WORKDIR /Sonos-Kids-Controller-master
#RUN pm2 start server.js
#RUN pm2 save