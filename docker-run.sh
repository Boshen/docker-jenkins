#!/bin/bash

docker run --name jenkins -d -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 jenkins-docker
