#!/bin/bash

echo "Creating User and Setting it up"

# Creation of user
useradd -m zoy

# Add user to sudo group
adduser zoy sudo

# Set password of user
echo "zoy:wiro212" | chpasswd

# Change default shell from sh to bash
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

echo "User Created and Configured"

echo "Installing openssh"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -qq -n ngrok-stable-linux-amd64.zip
apt install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen

echo "Setting up SSH"

# Run sshd in the background
chmod +x /usr/sbin/sshd
/usr/sbin/sshd -D &

sleep 2

echo "Setting up ngrok"

# Static ngrok authentication token
authtoken="2RIDE4oxtvtFSHR9Ea1dI3BZnZo_4hoNaQK6cLt3j3WHpjc9E"

# Select ngrok region
echo "Select ngrok region:"
echo "1. US - United States"
echo "2. EU - Europe"
echo "3. AP - Asia Pacific"
read -p "Enter your choice (1-3): " region

case $region in
  1)
    ngrok_region="us"
    ;;
  2)
    ngrok_region="eu"
    ;;
  3)
    ngrok_region="ap"
    ;;
  *)
    echo "Invalid choice. Using default region (US)."
    ngrok_region="us"
    ;;
esac

# Create tunnel with selected region
./ngrok authtoken $authtoken && ./ngrok tcp -region=$ngrok_region 22 &

sleep 5

echo "SSH command:"
curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url' | cut -d'/' -f3 | awk -F':' '{print "ssh -p " $2 " root@" $1}'

echo "Root password: wiro212"
