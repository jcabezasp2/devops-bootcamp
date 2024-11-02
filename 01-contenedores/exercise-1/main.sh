#!/bin/bash

# Network
# Los tres componentes deben estar en una red llamada lemoncode-challenge
# 
docker network create -d bridge lemoncode-challenge


# MongoDB
# El MongoDB debe almacenar la información que va generando en un volumen, mapeado a la ruta /data/db
# debe de tener una base de datos llamada TopicstoreDb
# con una colección llamada Topics
# La colección Topics debe tener esta estructura:
# {
#   "_id": { "$oid" : "5fa2ca6abe7a379ec4234883" },
#   "topicName" : "Contenedores"
# }
# El backend debe comunicarse con el mongodb a través de esta URL mongodb://some-mongo:27017
docker build -t database:latest -f ./database/Dockerfile ./database
docker run -d --name some-mongo --network lemoncode-challenge -v /tmp/database:/data/db database:latest



# Back
# El front-end debe comunicarse con la api a través de http://topics-api:5000/api/topics.
# 
docker build -t backend:latest -f ./backend/Dockerfile ./backend
docker run -d --name topics-api --env-file ./backend/.env --network lemoncode-challenge backend:latest

# Front
# El front-end debe estar mapeado con el host para ser accesible a través del puerto 8080.
# 
docker build -t frontend:latest -f ./frontend/Dockerfile ./frontend
docker run -d --name topics-front -p 8080:3000 --env-file ./frontend/.env --network lemoncode-challenge frontend:latest
