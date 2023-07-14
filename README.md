#  Deployment Automation on EKS Using CI/CD jenkins

## Project Description:
* Build infrastructure on [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/)
* From [Terraform](https://www.terraform.io/),i create bastion ec2 to access on Private Elastic Kubernetes Service (EKS)
* Deploy [Jenkins Master](https://www.jenkins.io/) and [Jenkins slave](https://www.jenkins.io/) as a Pod on Private EKS cluster
* Dockerized a simple website  using [Docker](https://www.docker.com/)
* From [Jenkins](https://www.jenkins.io/) pipepline deploy a simple [website](https://github.com/hazemhashem881/CI-CD_k8s) on :
   * Private EKS cluster 
   * Docker on Private worker node
## How to run The project :
### 1- Frist part :
* Install on your local machine :
     * Terraform
     * Kubectl
     * AWS
     *  Configure you aws account

### 2- Second Part:
  #### 1. Clone The Repo:
  ```
git clone https://github.com/hazemhashem881/Project-Infra-EKS.git
  ```
> After cloning the code , go to the `eks` directory to build the infrastructure:

```
cd /Project-Infra-EKS/eks
```
#### 2. Initialize Terraform
> Notice Before Initialize Terraform :
###### 1.Must configure backend file
###### 2.ADD ur prive Key inside config script to can access  private worker node
###### 3.Enter your path of private key inside ec2 file so that ur locan machine access bastion ec2 vi SSH to transfer k8s folder to bastion ec2
```
terraform init
```
> then Check Plan
```
terraform plan --var-file dev.tfvars
```
> then Apply the Apply
```
terraform apply --var-file dev.tfvars
```
#### 3. Configure Docker on worker node to pipeline can be run
  * Access EC2 bastion vi SSH From your local machine
     *  then access worker node form EC2 bastion vi SSH
        * Then run these command :
          ```
          sudo rm -rf /var/run/docker.sock
          sudo yum update -y
          sudo yum install docker -y
          sudo usermod -a -G docker ec2-user
          newgrp docker
          sudo systemctl start docker
          sudo systemctl start docker.service
          sudo systemctl enable docker.service
          ```
### 4. Connect to EKS Cluster
> You can connect on your local machine or EC2 bastion
```
aws eks --region <region_name> update-kubeconfig --name <cluster_name>
```
#### for example:
```
aws eks update-kubeconfig --region us-east-1 --name dev_eks_cluster
```
### 5. Deploying the jenkins app on EKS cluster
> go to k8s directory then run apply.sh
```
cd ..
cd k8s
./apply.sh
```
### 6. Get `admin` user Password

```
kubectl logs -n <namespace> <pod_name>  
```
### 7. Get `url` of jenkins

```
kubectl get -n <namespace> svc 
```
### 8. copy external ip of jenkins master from

```
kubectl get -n <namespace> svc   
```
### 9. go to credentials of manage jenkins and add account docker hub 
### 10. Then go to Node and Clouds of  manage jenkins configure Node
### 11. start SSH on jenkins slave and switch user to jenkins and create ssh key then take private key to Jenkins Node

```
kubectl get -n <namespace> svc
kubectl exec -it -n <namespace> <pod_name> /bin/bash
service ssh start
su jenkins
ssh-keygen
cat id_rsa.pub > authorized_keys
```
### 12.create pipeline and take url of github of jenkins pipline
```
https://github.com/hazemhashem881/CI-CD_k8s
```
# This is my video to see running this steps [video OF Project]()
