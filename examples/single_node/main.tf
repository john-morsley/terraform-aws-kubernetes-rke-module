﻿#       _____ _             _      
#      / ____(_)           | |     
#     | (___  _ _ __   __ _| | ___ 
#      \___ \| | '_ \ / _` | |/ _ \
#      ____) | | | | | (_| | |  __/
#     |_____/|_|_| |_|\__, |_|\___|
#             _   _    __/ |  _     
#            | \ | |  |___/  | |
#            |  \| | ___   __| | ___ 
#            | . ` |/ _ \ / _` |/ _ \
#            | |\  | (_) | (_| |  __/
#            |_| \_|\___/ \__,_|\___|
#                 _____ _           _            
#                / ____| |         | |           
#               | |    | |_   _ ___| |_ ___ _ __ 
#               | |    | | | | / __| __/ _ \ '__|
#               | |____| | |_| \__ \ ||  __/ |   
#                \_____|_|\__,_|___/\__\___|_|   

module "single-node-cluster" {

  source = "./../../../terraform-aws-kubernetes-cluster"
  #source = "john-morsley/terraform-aws-vpc"

  cluster_name = local.cluster_name 
  
  bucket_name = local.bucket_name
  
  folder = "single-node-cluster"
  
  ec2_data = [{
    user = "ubuntu"
    role = ["controlplane", "etcd", "worker"]
    public_ip = module.node-1.public_ip
    private_ip = module.node-1.private_ip
    encoded_private_key = module.node-1.encoded_private_key
  }]
  
//  tags = {
//    Owner = "john-doe"
//  }

}