#!/bin/bash

# Check if docker and docker-compose is installed on the system
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Installing Docker..."
    # Install Docker
    sudo apt-get update
    sudo apt-get install docker.io -y
fi

if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    # Install Docker Compose
    sudo apt-get update
    sudo apt-get install docker-compose -y
fi
# Check if site name is provided as a command-line argument
if [ -z "$1" ]
then
    echo "Please provide the site name as a command-line argument."
    exit 1
fi

# Create a WordPress site using the latest WordPress version
echo "Creating WordPress site..."
docker-compose up -d

# Add /etc/hosts entry for example.com pointing to localhost
echo "Adding /etc/hosts entry for example.com..."
echo "127.0.0.1 example.com" | sudo tee -a /etc/hosts

# Prompt user to open example.com in a browser
echo -e "\033[0;32m WordPress site created successfully. 
	Please open http://example.com in your browser."

# Add subcommand to enable/disable the site
if [ "$2" == "enable" ]
then
    echo -e "/033[0;32mEnabling site...]"
    docker-compose start
elif [ "$2" == "disable" ]
then
    echo -e "/033[0;31mDisabling site...]"
    docker-compose stop
fi

if [ "$2" == "delete" ]
then
    echo -e "\033[0;31mDeleting site...]"
    docker-compose down
fi

