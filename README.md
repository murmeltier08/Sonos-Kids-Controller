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
Tested with Docker Desktop for Mac
```
 docker run -p 8200:8200 -v /your/local/path/for/config:/Sonos-Kids-Controller-master/server/config/ murmeltier08/sonos-kids-controller 
```
