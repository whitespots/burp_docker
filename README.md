# BurpSuite pro in docker

## Requirements

- License key
- Read this man till the end :)

## Steps to run

1. Get your trial [here](https://portswigger.net/burp/pro/trial)/pay for your license key.
2. `git clone https://github.com/whitespots/burp_docker.git`
3. Create a `key.txt` file and place your key there or just pass to the next step
4. Export environment with `export BURP_KEY="$(cat key.txt)"` or  `export BURP_KEY="Your_Burp_Key"`
5. Run build with `docker build -t burp_docker .`
6. Run it:

```bash
docker run --rm \
  -e BURP_KEY=$BURP_KEY \
  -v "$(pwd):/home/burp/.java" \
  -p 8080:8080 \
  -p 1337:1337 \
  --name burp-suite-pro \
  burp_docker
```

7. Have fun with your security researches. API is here `http://0.0.0.0:1337`

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
