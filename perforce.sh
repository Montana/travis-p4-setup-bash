#!/bin/bash

# Fetch P4 Helix Core CLI 
wget -qO - https://package.perforce.com/perforce.pubkey | sudo gpg --dearmor -o /usr/share/keyrings/perforce-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/perforce-archive-keyring.gpg] http://package.perforce.com/apt/ubuntu focal release" | sudo tee /etc/apt/sources.list.d/perforce.list
sudo apt update
sudo apt install helix-cli

# Create folders p4repo & p4repo/db 
mkdir ~/p4repo
mkdir ~/p4repo/db 

# Start Perforce
/path/to/downloaded/p4d -L ~/p4repo/p4d.log -r ~/p4repo/db -v dm.integ.engine=3

# Inform user they need to press Ctrl+C 
echo "Press Ctrl+C."

# Run previous commands
/path/to/downloaded/p4d -xi -L ~/p4repo/p4d.log -r ~/p4repo/db -v dm.integ.engine=3
/path/to/downloaded/p4d -L ~/p4repo/p4d.log -r ~/p4repo/db -v dm.integ.engine=3

# Create a ~/p4 folder, then ~/p4/p4config.txt file 
mkdir ~/p4 
mkdir ~/p4/p4config.txt 
export P4CONFIG=~/p4/p4config.txt 
p4 info
echo "Set a password for your account."
p4 passwd 

# Input credentials for p4config.txt 
echo "Opening up p4config.txt with Vim"
sudo vim ~/p4/p4config.txt 
