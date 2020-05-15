#!/bin/bash

#      _____       _____             _               
#     |_   _|     |  __ \           | |             
#       | |  ___  | |  | | ___   ___| | _____ _ __ 
#       | | / __| | |  | |/ _ \ / __| |/ / _ \ '__| 
#      _| |_\__ \ | |__| | (_) | (__|   <  __/ |     
#     |_____|___/ |_____/ \___/ \___|_|\_\___|_|     
#          _____                _         ___  
#         |  __ \              | |       |__ \ 
#         | |__) |___  __ _  __| |_   _     ) |
#         |  _  // _ \/ _` |/ _` | | | |   / / 
#         | | \ \  __/ (_| | (_| | |_| |  |_|  
#         |_|  \_\___|\__,_|\__,_|\__, |  (_)  
#                                  __/ |       
#                                 |___/        

echo 'IS DOCKER READY...?'

is_docker_running () {

    state=$(systemctl show --property ActiveState docker)

    if [[ $state == ActiveState=active ]]; then
        echo "Yes"
        return 1
    else
        echo "No"
        return 0
    fi

}

while true
do
    
    is_docker_running

    if [[ $? == 1 ]]; then
        break
    fi

    sleep 1

done

echo "docker info"
docker info

echo 'DOCKER IS READY :-)'

exit 0