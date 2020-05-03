#!/bin/sh

#      _____           _        _ _   _____             _             
#     |_   _|         | |      | | | |  __ \           | |            
#       | |  _ __  ___| |_ __ _| | | | |  | | ___   ___| | _____ _ __ 
#       | | | '_ \/ __| __/ _` | | | | |  | |/ _ \ / __| |/ / _ \ '__|
#      _| |_| | | \__ \ || (_| | | | | |__| | (_) | (__|   <  __/ |   
#     |_____|_| |_|___/\__\__,_|_|_| |_____/ \___/ \___|_|\_\___|_|   
#                                                                 
                                                                 
echo 'INSTALLING DOCKER...'

curl https://releases.rancher.com/install-docker/19.03.sh | sh

sudo usermod -aG docker ubuntu

echo 'DOCKER INSTALLED :-)'

exit 0