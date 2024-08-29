#!/bin/bash

sudo apt-get update
curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/main.sh | bash &>/dev/null
curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/docker.sh | bash &>/dev/null
sudo apt-get install --only-upgrade -y docker-ce docker-ce-cli containerd.io

sudo systemctl restart docker
docker --version

# Закидываем докер ниллион
docker pull nillion/retailtoken-accuser:v1.0.0

mkdir -p nillion/accuser
sleep 30
docker run -v ./nillion/accuser:/var/tmp nillion/retailtoken-accuser:v1.0.0 initialise

echo "Установка завершена!"
