# Overview
This repository contains Docker code for building an Azure DevOps Docker image.

* Ubuntu 20.04


# Commands

Build the docker image from the Dockerfile
```sh
$ docker build -t adoagent:v1.0.0 .
```

Deploy container with a custom name
```sh
docker run -d -e AZP_URL=https://dev.azure.com/MrBlnd -e AZP_TOKEN=<<TOKEN_HERE>>-e AZP_AGENT_NAME=ado_agent -e AZP_POOL=ado_pool adoagent:v1.0.0
```

Deploy container with the containers hostname
```sh
$ docker run -d -e AZP_URL=https://dev.azure.com/MrBlnd -e AZP_TOKEN=<<TOKEN_HERE>> -e AZP_POOL=docker adoagent:v1.0.0
```


