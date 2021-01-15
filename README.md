Steps to run this project :<a name="TOP"></a>
===================


## 1: (Optional) If you are using the VM42, run :
```bash
systemctl stop nginx
```

## 2: Clone the project and launch :
To build :
```bash
docker build -t ft_server .
```

To run :
```bash
docker run -ti -p 443:443 -p 80:80 ft_server
```

## 3: Launch a web browser and type :
```bash
https://localhost
```

To switch auto-index to ON or OFF
```bash
bash auto-index.sh
```

To log into PhpMyAdmin
```bash
login : admin
password : admin
```

## 4: Quit
Type 'exit' of 'CTRL+D' to quit the container.


## 5: Clean image :
```bash
docker image rm -f ft_server debian:buster
```

## Commands :
To switch auto-index to ON or OFF
```bash
bash auto-index.sh
```
