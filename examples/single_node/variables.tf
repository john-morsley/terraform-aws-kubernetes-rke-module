#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

variable "region" {
  type = string
  default = "eu-west-2" # London
}

# VPC

variable "vpc_name" {
  type = string
  default = "single-node-kubernetes-cluster"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS)
}

variable "vpc_public_subnets" {
  type = list(string)
  default = ["10.0.0.0/24"] # 251 (256 possible - 5 reserved by AWS)
}

# IAM Role

variable "iam_role_name" {
  type = string
  default = "rke"
}

# EC2 (Node)

variable "ec2_name" {
  type = string
  default = "node-1"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.xlarge"
}
