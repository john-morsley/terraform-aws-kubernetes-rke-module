#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

# Cluster

variable "cluster_name" {
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

variable "number_of_nodes" {
  type    = number
  default = 1
}

variable "ec2_name" {
  type    = string
  default = "node"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.xlarge"
}

//variable "node_data" {
//  description = "This object will contain data from the nodes and will be passed to the cluster."
//  type = list(object({
//    user                = string
//    role                = list(string) 
//    public_ip           = string
//    private_ip          = string
//    encoded_private_key = string
//  }))
//  default = []
//}

//node_data = type = list 
//    {
//      user                = "ubuntu"
//      role                = ["controlplane", "etcd", "worker"]
//      public_ip           = module.node-1.public_ip
//      private_ip          = module.node-1.private_ip
//      encoded_private_key = module.node-1.encoded_private_key
//    },
//    {
//      user                = "ubuntu"
//      role                = ["controlplane", "etcd", "worker"]
//      public_ip           = module.node-2.public_ip
//      private_ip          = module.node-2.private_ip
//      encoded_private_key = module.node-2.encoded_private_key
//    }

# Domain

//variable "domain" {
//  type = string
//}
//
//variable "sub_domain" {
//  type = string
//}