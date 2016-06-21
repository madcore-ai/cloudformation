wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins openjdk-7-jdk git

curl -fsSL https://get.docker.com/ | sh
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
curl -sSf https://static.rust-lang.org/rustup.sh | sh
usermod -aG docker jenkins
usermod -aG docker hab
 
groupadd hab && useradd -g hab -d /home/hab -s /bin/bash -m hab
pushd to ~/git (on jenkins user)
git clone https://github.com/habitat-sh/habitat
bash /var/lib/jenkins/git/habitat/components/hab/install.sh
