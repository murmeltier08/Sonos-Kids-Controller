FROM balenalib/raspberry-pi-debian:latest-20201118
RUN apt-get update
#INSTALL  
RUN apt-get install npm
RUN apt-get install wget
RUN apt-get install unzip
# debug could not get uid/gid" error.
RUN npm config set unsafe-perm true
RUN npm install -g @ionic/cli
RUN wget https://github.com/Thyraz/Sonos-Kids-Controller/archive/master.zip
RUN unzip master.zip
RUN rm master.zip 
WORKDIR /Sonos-Kids-Controller-master
RUN npm install ionic build --prod
WORKDIR /server/config


