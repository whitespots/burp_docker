# BurpSuite pro in docker

## Requirements

- License key
- Read this man till the end :)

## Steps to run

1. Register at [portswigger](https://portswigger.net/users/youraccount)
2. Get your trial/pay for your license key
3. `git clone https://github.com/whitespots/burp_docker.git`
4. Edit the `entrypoint.sh` file (paste your key there)
5. Run build with `docker build -t burp_docker .`
6. Run it an have fun with your security researches

```bash
docker run --rm \
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
