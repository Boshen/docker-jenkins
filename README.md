Install Jenkins with docker in docker

Run on host:
docker version

Replace `docker-ce=18.06.3~ce~3-0~debian` (inside Dockerfile) with the host docker client version

Run inside jenkins:
docker -it jenkins /bin/bash
docker version

docker client versions should match, and all docker results (e.g. `docker images`) should match
