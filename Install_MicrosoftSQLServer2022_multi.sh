#This script will install Microsoft SQL Server 2022 on an Ubuntu 20.04 Machine. 

## Prerequisites
echo "Setup will now update the system to prepare for installation."
sudo apt update
sudo apt upgrade -y

## Dependency Packages Procurement
sudo apt install software-properties-common wget gnupg2

## Add Microsoft SQL Server Repo & GPG Key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
wget https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list
sudo mv mssql-server-2022.list /etc/apt/sources.list.d/microsoft-prod.list

## Install MSSQL Server
sudo apt update
sudo apt install mssql-server

## Lastly, launch the setup for the user to complete
sudo /opt/mssql/bin/mssql-conf setup