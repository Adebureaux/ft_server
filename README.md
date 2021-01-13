##Steps to run this project :

## 1: (Optional) If you are using the VM42, run :
```bash
systemctl stop nginx
```

## 2: Clone the project and launch :
```bash
docker build -t ft_server .
```

```bash
docker run -ti -p 443:443 -p 80:80 ft_server
```

## 3: Launch a web browser and type :
```bash
https://localhost
```

## 4: Quit
Type `CTRL + D` to quit the container.

## 5: Clean image :
```bash
docker imagge rm -f ft_server debian:buster
```