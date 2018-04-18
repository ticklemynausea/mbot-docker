# mbot-docker

build and provision an ubuntu docker environment so mbot and its dependencies can be built and run inside it.

done as an exercise in dockering.

## Running

```
cd mbot-docker
docker build . -t mbot
docker volume create mbot-vol

# copy mbot-conf files into the newly created volume

docker run -v mbot-vol:/vol:rw -d mbot:latest
```
