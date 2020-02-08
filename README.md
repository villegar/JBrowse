# JBrowse

To pull the image to your local machine, use the following command:
```bash
docker pull villegar/jbrowse
```

To create a new container using previously downloaded image:
```bash
docker container run --publish=80:8082 --name riparia -d villegar/jbrowse:latest
```

To modify the newly created container:
```bash
docker container exec -it riparia bash
```

To stop the container:
```bash
docker container stop riparia
```

To remove the container from local storage:
```bash
docker container rm riparia
```
