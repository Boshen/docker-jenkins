Install Jenkins with docker in docker

Run on host:
docker version

Replace `docker-ce=18.06.3~ce~3-0~debian` (inside Dockerfile) with the host docker client version

Run inside jenkins:
docker -it jenkins /bin/bash
docker version

docker client versions should match, and all docker results (e.g. `docker images`) should match

To change timezone, in Script Console:
```
System.setProperty('org.apache.commons.jelly.tags.fmt.timeZone', 'Asia/Shanghai')
```

Add webhook, in Github - Project - Settings - Webhooks
```
https:/jenkins.xxx.com/github-webhook/
```

Prune everyday
```
crontab -l | { cat; echo "0 19 * * * docker system prune --volumes -f"; } | crontab -
```
