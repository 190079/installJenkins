#!/bin/bash
echo "Adding Keys"
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
echo "Importing the jenkins keys"
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
cat /etc/yum.repos.d/jenkins.repo
echo "Installing jenkins"
sudo yum install jenkins -y
echo "Enabling jenkins service"
sudo systemctl start jenkins
sudo systemctl enable jenkins
echo "Jenkins status"
systemctl status jenkins
"Enabling Firewalls"
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
clear
echo "initialAdminPassword"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
