#./deploy.sh

# if docker/git exits skip this step, else run this step
if hash docker 2>/dev/null && hash docker-compose 2>/dev/null && hash git 2>/dev/null
then
else
	sudo apt-get --yes install git
	sudo apt-get --yes remove docker docker-engine
	sudo apt-get --yes update
	sudo apt-get --yes install apt-transport-https ca-certificates curl software-properties-common
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 
	sudo apt-key fingerprint OEBFCD88
	sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"
	sudo apt-get update
	sudo apt-get --yes install docker-ce
	sudo -i & curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose & exit
	sudo chmod +x /usr/local/bin/docker-compose
fi

cd ~/semaphore-test && sudo docker-compose up -d

# ssh-keyscan -H -p 22 34.211.225.42 >> ~/.ssh/known_hosts
# ssh ubuntu@34.211.225.42 "sudo git clone https://github.com/chingtoe365/semaphore-test.git"
# ssh ubuntu@34.211.225.42 "sudo apt-get --yes install git"
# ssh ubuntu@34.211.225.42 "sudo apt-get --yes remove docker docker-engine"
# ssh ubuntu@34.211.225.42 "sudo apt-get --yes update"
# ssh ubuntu@34.211.225.42 "sudo apt-get --yes install apt-transport-https ca-certificates curl software-properties-common"
# ssh ubuntu@34.211.225.42 "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add "
# ssh ubuntu@34.211.225.42 "sudo apt-key fingerprint OEBFCD88"
# ssh ubuntu@34.211.225.42 "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\""
# ssh ubuntu@34.211.225.42 "sudo apt-get update"
# ssh ubuntu@34.211.225.42 "sudo apt-get --yes install docker-ce"
# ssh ubuntu@34.211.225.42 "sudo -i & curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose & exit"
# ssh ubuntu@34.211.225.42 "sudo chmod +x /usr/local/bin/docker-compose"
# ssh ubuntu@34.211.225.42 "cd ~/semaphore-test && sudo docker-compose up -d"