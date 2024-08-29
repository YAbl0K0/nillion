sleep $(( RANDOM % 601 + 3000 ))
docker run -d --name nillion_run_docker -v $HOME/nillion/accuser:/var/tmp nillion/retailtoken-accuser:v1.0.0 accuse --rpc-endpoint "https://testnet-nillion-rpc.lavenderfive.com" --block-start 5112621
