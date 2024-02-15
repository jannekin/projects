# PilviG Kinnunen Janne, Pulkkinen Aku, Saarela Arttu

# Sovelluksen pystyy luomaan helpoiten scriptien avulla.

# server.sh scriptin ajaessa täytyy olla ./server kansiosssa.
# Server scriptin pystyy ajamaan komennolla
./server.sh
# Jos ohjelma ilmoittaa oikeuksien puutteesta käytä komentoa
chmod 777 ./server.sh
# Ja aja scripti komento uudestaan.
./server.sh

# client.sh scriptin ajaessa täytyy olla ./client kansiosssa.
# Client scriptin pystyy ajamaan komennolla
./client.sh
# Jos ohjelma ilmoittaa oikeuksien puutteesta käytä komentoa
chmod 777 ./client.sh
# Ja aja scripti komento uudestaan.
./client.sh

# Ohjelman pystyy ajamaan myös alla olevilla komennoilla, jos ei halua scriptiä käyttää.

# Networkin luominen
docker network create networkpilvig

# Volumen luominen clientille
docker volume create -o type=none -o device="$(pwd)/clientdata" -o o=bind clientvol

# Volumen luominen serverille
docker volume create -o type=none -o device="$(pwd)/serverdata" -o o=bind servervol

# (Huomio! Jotta pystyy luomaan server image ja käynnistämään serverin, niin pitää olla kansiossa ./server)
# Server imagen luominen
docker build -t server-kuva .
# Serverin käynnistys
docker run -d --rm --name server --network networkpilvig server-kuva

# (Huomio! Jotta pystyy luomaan client image ja käynnistämään clientin, niin pitää olla kansiossa ./client)
# Client imagen luominen
docker build -t client-kuva .
# Clientin käynnistys
docker run -it --rm --name client --network networkpilvig client-kuva
