#!/bin/bash

# Client imagen luominen
docker build -t client-kuva .

# Volumen luominen clientille
docker volume create -o type=none -o device="$(pwd)/clientdata" -o o=bind clientvol

# Clientin käynnistys
docker run -it --rm --name client --network networkpilvig client-kuva
