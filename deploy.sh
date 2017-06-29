#./deploy.sh

# Install git/docker/docker-compose on AWS server (notice there might be prompts)
sudo apt-get --yes install git
sudo apt-get --yes remove docker docker-engine
sudo apt-get --yes update
sudo apt-get --yes install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get --yes install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
sudo apt-key fingerprint OEBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update
sudo apt-get --yes install docker-ce
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
exit
sudo chmod +x /usr/local/bin/docker-compose

# build and run docker container
sudo docker-compose up -d
