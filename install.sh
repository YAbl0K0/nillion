#!/bin/bash

sudo apt-get update
curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/main.sh | bash &>/dev/null
curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/docker.sh | bash &>/dev/null
sudo apt-get install --only-upgrade -y docker-ce docker-ce-cli containerd.io

sudo systemctl restart docker
docker --version

# Закидываем докер ниллион
if docker pull nillion/retailtoken-accuser:v1.0.0; then
  echo "Образ успешно загружен"
else
  echo "Ошибка загрузки образа" >&2
  exit 1
fi

mkdir -p nillion/accuser
sleep 30
docker run -v ./nillion/accuser:/var/tmp nillion/retailtoken-accuser:v1.0.0 initialise

echo "Установка завершена!"

tmux new-session -d -s nillion_run 'docker run -v ./nillion/accuser:/var/tmp nillion/retailtoken-accuser:v1.0.0 accuse --rpc-endpoint "https://testnet-nillion-rpc.lavenderfive.com" --block-start 5127642'
