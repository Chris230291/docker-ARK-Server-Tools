#!/bin/bash

# Create base config if it doesnt exist
if [[ ! -e /etc/arkmanager/arkmanager.cfg ]]
then
echo "Creating 'arkmanager.cfg'"
sudo curl -s -o /etc/arkmanager/arkmanager.cfg https://raw.githubusercontent.com/arkmanager/ark-server-tools/master/tools/arkmanager.cfg
fi

# Create instance example if it doesnt exist
if [[ ! -e /etc/arkmanager/instances/instance.cfg.example ]]
then
echo "Creating 'instance.cfg.example'"
sudo curl -s --create-dirs -o /etc/arkmanager/instances/instance.cfg.example https://raw.githubusercontent.com/arkmanager/ark-server-tools/master/tools/instance.cfg.example
fi

# Make sure steam owns these directories
sudo chown steam:steam -R /config

if [ ${UPDATETOOLS} -eq 1 ]
then
yes | arkmanager upgrade-tools
fi

if [ ${STARTSERVERS} -eq 1 ]
then
echo "Starting Server(s)" && arkmanager start @all
fi

echo "Done"

# Keep container running
sleep infinity
