# BurpSuite pro in docker

## Requirements

- License key
- Read this man till the end :)

## Steps to run

1. Get your trial [here](https://portswigger.net/burp/pro/trial)/pay for your license key.
2. `git clone https://github.com/whitespots/burp_docker.git`
3. Run build with `docker build -t burp_docker .`
4. Run it an have fun with your security researches

```bash
export BURP_KEY="Your_Burp_Key" && \
docker run --rm \
  -e BURP_KEY=$BURP_KEY
  -v "$(pwd):/home/burp/.java" \
  -p 8080:8080 \
  -p 1337:1337 \
  --name burp-suite-pro \
  burp_docker
```

## API authentication setup 

Edit the following settings in `user_options.json`

```json
"api": {
    "enabled": true,
    "insecure_mode": true,
    "keys": [],
    "listen_mode": "all_interfaces",
    "port": 1337
}
```

From whitespots.io with love
