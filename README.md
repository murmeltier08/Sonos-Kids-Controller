# Sonos-Kids-Controller Docker 
Refer to https://github.com/Thyraz/Sonos-Kids-Controller for all the configuration detail
# Example code
```
 docker run -it -p 8200:8200 -v /your/local/path:/Sonos-Kids-Controller-master/server/config/ murmeltier08/sonos-kids-controller 
```
docker run \
  --net=host \
  --name sonos \
  --restart=always \
  -d \
  -v `pwd`/settings:/app/settings \
  -v `pwd`/clips:/app/static/clips \
  -v `pwd`/cache:/app/cache \
  -v `pwd`/presets:/app/presets \
  chrisns/docker-node-sonos-http-api
```  
