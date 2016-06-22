#!/bin/bash -v
# Ubuntu Trusty
# From Ubuntu user
pushd /tmp
    sudo wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install openjdk-7-jdk git jenkins -y
    sudo groupadd hab && useradd -g hab -s /bin/bash -m hab
    sudo usermod -aG docker jenkins
    sudo usermod -aG docker hab
    sudo curl -fsSL https://get.docker.com/ | sh
    sudo curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    sudo curl -sSf https://static.rust-lang.org/rustup.sh | sh
popd

sudo su -c "mkdir -p /var/lib/jenkins/git/habitat" jenkins
sudo su -c "git clone https://github.com/habitat-sh/habitat /var/lib/jenkins/git/habitat" jenkins
sudo su -c "/var/lib/jenkins/git/habitat/components/hab/install.sh" 
sudo su -c "java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://127.0.0.1:8080 install-plugin job-dsl -deploy" jenkins



