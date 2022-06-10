#!/bin/bash

PS3='Please enter your choice: '
options=("reload" "restart" "CLI" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "reload")
            docker exec -it $(docker-compose ps -q web) nginx -s reload
            ;;
        "restart")
	    docker-compose restart
            ;;
        "CLI")
            docker exec -it $(docker-compose ps -q web) /bin/sh 
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
