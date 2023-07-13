sudo rm -rf /var/run/docker.sock
sudo yum update -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
newgrp docker
sudo systemctl start docker
sudo systemctl start docker.service
sudo systemctl enable docker.service



aws eks update-kubeconfig --region us-east-1 --name dev_eks_cluster

