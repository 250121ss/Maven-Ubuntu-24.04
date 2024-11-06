#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y

# Install the default JDK
echo "Installing default JDK..."
sudo apt install -y default-jdk

# Download Maven
echo "Downloading Maven..."
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz -P /tmp

# Extract Maven to the /opt directory
echo "Installing Maven..."
sudo tar xf /tmp/apache-maven-3.9.9-bin.tar.gz -C /opt

# Setup Maven environment variables
echo "Setting up Maven environment variables..."
sudo bash -c 'cat > /etc/profile.d/maven.sh' <<EOL
export JAVA_HOME=/usr/lib/jvm/default-java
export M3_HOME=/opt/apache-maven-3.9.9
export MAVEN_HOME=/opt/apache-maven-3.9.9
export PATH=\${M3_HOME}/bin:\${PATH}
EOL

# Make the environment script executable
echo "Applying environment changes..."
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# Verify Maven installation
echo "Verifying Maven installation..."
mvn -version
