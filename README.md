Simple dockerized instance of ARK Server Tools

Parameters:

`e UPDATETOOLS=1`   <-- Try to update ARK Server Tools when the container starts

`e STARTSERVERS=1`  <-- Start all instances when the container starts

Example:

```
docker create \
--name=ARK-Server-Tools \
--net=host \
--restart=always \
-v /path/on/host/ARK/Configs:/etc/arkmanager \
-v /path/on/host/ARK/Steam:/home/steam/Steam \
-v /path/on/host/ARK:/home/steam/ARK \
-v /path/on/host/ARK/ARK-Backups:/home/steam/ARK-Backups \
-v /path/on/host/ARK/ARK-Staging:/home/steam/ARK-Staging \
-v /path/on/host/ARK/Logs:/var/log/arktools \
-e UPDATETOOLS=1 \
-e STARTSERVERS=0 \
chris230291/ark-server-tools
```
