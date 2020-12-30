#       _____ _             _      
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

module "multiple-node-cluster" {

  source = "./../../../terraform-aws-kubernetes-rke"
  #source = "john-morsley/kubernetes-rke/aws"

  cluster_name = var.cluster_name

  bucket_name = module.s3_bucket.name

  node_data = [
    for node in module.nodes : {
      user                = "ubuntu"
      role                = ["controlplane", "etcd", "worker"]
      public_ip           = node.public_ip
      private_ip          = node.private_ip
      encoded_private_key = node.encoded_private_key
    }
  ]

  depends_on = [
    module.vpc,
    module.nodes,
    module.cluster-sg,
  ]

}