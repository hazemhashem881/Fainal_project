variable "vpc_cidr" {
  type = string
}
variable "ws_name" {
  type = string
}
variable "region" {
  type = string
}
variable "pub_subnet1" {
  type = string
}
variable "pub_subnet2" {
  type = string
}
variable "priv_subnet1" {
  type = string
}
variable "priv_subnet2" {
  type = string
}

variable "ami" {
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
