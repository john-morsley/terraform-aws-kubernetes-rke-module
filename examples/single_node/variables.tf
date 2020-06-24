#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

# Cluster

variable "name" {
  type = string
}

# VPC

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

# IAM Role

variable "iam_role_name" {
  type    = string
  default = "rke"
}

# EC2 (Node)

variable "ec2_name" {
  type    = string
  default = "node"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.xlarge"
}