A simple project to illustrate the mechanics of a Python FastAPI server
deployed using Docker

Docker Commands Used
====================

Context control:

        docker context ls
        docker context create --docker host=tcp://192.168.8.102:2375 pi4
        docker context use pi4

Build Container image into local registry:

        docker build -t myimage .
        docker image ls

Run container from local registry:

        docker run -d --name mycontainer --restart=unless-stopped -p 8080:80 myimage

Listing running containers:

        docker container ls

Stop container:

        docker container stop mycontainer

Tag the container, uplaod it, and run it from Dockerhub:

        docker login
        docker tag myimage:latest brucemack/myimage:1.0
        docker push brucemack/myimage:1.0
        docker run -d --name mycontainer -v myvol:/app -p 8080:80 brucemack/myimage:1.0

Remove container and force a stop:

        docker container ls
        docker container rm -f mycontainer

Cleanup:

        docker system prune
        
Create a volume and start a container with it.

        docker volume create myvol
        docker volume inspect myvol
        docker run -d --name mycontainer -v myvol:/app -p 8080:80 myimage

Looking at the volume using a special-purpose container:

        docker run --rm -i -v=myvol:/app busybox ls /app        
        docker run --rm -i -v=myvol:/app busybox cat /app/data.txt        

References
==========

* [Installing on RPI](https://www.digikey.com/en/maker/tutorials/2023/how-to-install-and-setup-docker-on-a-raspberry-pi)
* [FastPI Tutorial](https://fastapi.tiangolo.com/deployment/docker/)
