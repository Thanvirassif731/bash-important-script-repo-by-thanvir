#!/bin/bash
#
###############################################
# THIS FILE IS TO INSTALL JENKINS 
# CREATED BY THANVIR ASSIF ON 06-08-2025
# FOLLOW LINKS:
# YOUTUBE: https://www.youtube.com/@thanvirassif731
# GITHUB: http://github.com/Thanvirassif731/
# LINKEDIN: https://www.linkedin.com/in/thanvir-assif-1b3435203/
# WEBSITE: https://portfolio.thanvirassif.com
################################################

# Exit immediately if a command exits with a non-zero status.
set -e

# Update your Ubuntu Server
echo "Updating package list..."
sudo apt update
sudo apt upgrade

# Install Java JDK for Jenkins Installation
echo "Installing OpenJDK 17..."
sudo apt install -y openjdk-17-jdk

# Install Jenkins GPG Key
echo "Adding Jenkins GPG key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add the Jenkins repository to the system's sources list
echo "Adding Jenkins repository to APT sources..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the ubuntu again
echo "Updating package list with new Jenkins repository..."
sudo apt update

echo "Installing Jenkins..."
sudo apt-get install -y jenkins

# --- Post-installation steps ---
# Start and enable the Jenkins service
echo "Starting and enabling Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check the status of the Jenkins service
echo "Checking Jenkins service status..."
sudo systemctl status jenkins

# Get the initial admin password for the web setup
echo "Installation complete. Jenkins should be running on port 8080."
echo "Please navigate to http://<your_server_ip>:8080 to complete the setup."
echo "Here is the initial admin password to unlock Jenkins:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SCRIPT EXECUTED SUCCESSFULLY <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

# SCRIPT ENDS HERE! THANK YOU FOR UTILIZING THIS FILE. 

