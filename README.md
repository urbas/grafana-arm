# Grafana ARM

Image containing Grafana compiled for ARM.

Image tag:

```
urbas/grafana
```

Docker hub page: https://hub.docker.com/r/urbas/grafana/tags/

## Usage

```
sudo docker run -p 80:3000 urbas/grafana
```

## Build


```
sudo docker build .
```

## Tag & push

```
sudo docker tag <IMAGE ID> urbas/grafana:<VERSION>
sudo docker push urbas/grafana:<VERSION>
```
