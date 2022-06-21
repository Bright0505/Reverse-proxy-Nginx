#!/bin/bash

PS3='Please enter your choice: '
options=("test config" "reload" "restart" "CLI" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "test config")
            docker exec -it $(docker-compose ps -q web) nginx -t
            ;;
        "reload")
            docker exec -it $(docker-compose ps -q web) nginx -s reload
            ;;
        "restart")
            docker-compose restart
            ;;
        "CLI")
            docker exec -it $(docker-compose ps -q web) /bin/sh
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done