#!/bin/bash

# Server imagen luominen
docker build -t server-kuva .

# Networkin luominen
docker network create networkpilvig

# Volumen luominen serverille
docker volume create -o type=none -o device="$(pwd)/serverdata" -o o=bind servervol

# Serverin käynnistys
docker run -d --rm --name server --network networkpilvig server-kuva