module "network" {
  source = "./network"
  vpc_cidr=var.vpc_cidr
  region=var.region
  pub_subnet1=var.pub_subnet1
  pub_subnet2=var.pub_subnet2
  priv_subnet1=var.priv_subnet1
  priv_subnet2=var.priv_subnet2
  ws_name=var.ws_name
}

module "eks" {
  source = "./eks"
    
  ws_name= var.ws_name
  eks_sub1= module.network.priv_subnet1_id
  eks_sub2= module.network.priv_subnet2_id
  eks_sub3= module.network.pub_subnet1_id
  eks_sub4= module.network.pub_subnet2_id


  vpc_id= module.network.vpc_id
  sg_cidr=var.vpc_cidr
  instance_type = var.instance_type

  nodes_desired_size= var.nodes_desired_size
  nodes_max_size=var.nodes_max_size
  nodes_min_size=var.nodes_min_size
  ssh_key=var.ssh_key
}