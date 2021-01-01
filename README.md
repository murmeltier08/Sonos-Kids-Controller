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
The data.json will also stored in the volumes. 


# Example code
```
 docker run -it -p 8200:8200 -v /your/local/path/for/config:/Sonos-Kids-Controller-master/server/config/ murmeltier08/sonos-kids-controller 
```
