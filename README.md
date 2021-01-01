# Sonos-Kids-Controller Docker 
Refer to https://github.com/Thyraz/Sonos-Kids-Controller for all the configuration detail
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
The data.json will also stored in the volumes. So you will have your artist/albums after restart of the container


# Example code
```
 docker run -p 8200:8200 -p 5005:5005 -v /your/local/path/for/config:/Sonos-Kids-Controller-master/server/config/ murmeltier08/sonos-kids-controller 
```
