#!/bin/bash

sudo apt-get update
sudo apt-get install --only-upgrade -y docker-ce docker-ce-cli containerd.io

# Перезапускаем Docker для применения обновлений
sudo systemctl restart docker

# Проверяем текущую версию Docker
docker --version

# Выводим сообщение об успешном обновлении
echo "Docker успешно обновлен до последней версии."
