#!/bin/bash

# upgrade - build the latest image
docker build --no-cache --pull --rm --tag jenkins-docker:latest .
