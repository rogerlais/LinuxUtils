#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -remote_ip <remote_ip> -share_name <share_name> -mount_point <mount_point> -username <username> -password <password>"
	echo "Sample:"
	echo ".\\$0 -remote_ip pcname.local -share_name MyShare -mount_point /mnt/netshare/ -username myuser"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -remote_ip)
            remote_ip="$2"
            shift 2 ;;
        -share_name)
            share_name="$2"
            shift 2 ;;
        -mount_point)
            mount_point="$2"
            shift 2 ;;
        -username)
            username="$2"
            shift 2 ;;
        -password)
            password="$2"
            shift 2 ;;
        *)
            echo "Unknown option: $key"
            usage
            exit 1 ;;
    esac
done

# Check if any parameter is missing and prompt user for input
if [ -z "$remote_ip" ]; then
    read -p "Enter the remote computer's IP address: " remote_ip
fi
if [ -z "$share_name" ]; then
    read -p "Enter the name of the Windows share: " share_name
fi
if [ -z "$mount_point" ]; then
    read -p "Enter the local directory to mount the share: " mount_point
fi
if [ -z "$username" ]; then
    read -p "Enter your username for accessing the share: " username
fi
if [ -z "$password" ]; then
    read -sp "Enter your password for accessing the share: " password
    echo
fi

# Check if the remote computer is accessible
ping -c 1 $remote_ip > /dev/null
if [ $? -ne 0 ]; then
    echo "Remote computer is not accessible. Please check the network connection."
    exit 1
fi

# Check if cifs-utils is installed
if ! dpkg -s cifs-utils &> /dev/null; then
    echo "cifs-utils is not installed. Installing..."
    sudo apt update
    sudo apt install cifs-utils
fi

# Mount the Windows share
echo "Mounting Windows share..."
sudo mount -t cifs //$remote_ip/$share_name $mount_point -o username=$username,password=$password,dir_mode=0777,file_mode=0777
if [ $? -eq 0 ]; then
    echo "Windows share mounted successfully at $mount_point."
else
    echo "Failed to mount the Windows share."
fi