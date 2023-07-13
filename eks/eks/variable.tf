variable "vpc_id" {
  type = string
}
variable "sg_cidr" {
  type = string
}
variable "eks_sub1" {
  type = string
}
variable "eks_sub2" {
  type = string
}
variable "eks_sub3" {
  type = string
}
variable "eks_sub4" {
  type = string
}
variable "ws_name" {
  type = string
}

variable "nodes_desired_size" {
  type = string  
}
variable "nodes_max_size" {
  type = string  
}
variable "nodes_min_size" {
  type = string  
}
variable "ssh_key" {
  type = string
}
variable "instance_type" {
  type = string
}