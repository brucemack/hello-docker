A simple project to illustrate the mechanics of a Python FastAPI server
deployed using Docker

Docker Commands Used
====================

Context control:

        docker context ls
        docker context create --docker host=tcp://192.168.8.102:2375 pi4
        docker context use pi4

Build Container:

        docker build -t myimage .

Run container:

        docker run -d --name mycontainer --restart=unless-stopped -p 8080:80 myimage

Remove container and force a stop:

        docker container ls
        docker container rm -f mycontainer

