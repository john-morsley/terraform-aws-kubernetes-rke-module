#     __  __       _ _   _       _      
#    |  \/  |     | | | (_)     | |     
#    | \  / |_   _| | |_ _ _ __ | | ___ 
#    | |\/| | | | | | __| | '_ \| |/ _ \
#    | |  | | |_| | | |_| | |_) | |  __/
#    |_|  |_|\__,_|_|\__|_| .__/|_|\___|
#                _   _    | |    _     
#               | \ | |   |_|   | |
#               |  \| | ___   __| | ___ 
#               | . ` |/ _ \ / _` |/ _ \
#               | |\  | (_) | (_| |  __/
#               |_| \_|\___/ \__,_|\___|
#                 _____ _           _            
#                / ____| |         | |           
#               | |    | |_   _ ___| |_ ___ _ __ 
#               | |    | | | | / __| __/ _ \ '__|
#               | |____| | |_| \__ \ ||  __/ |   
#                \_____|_|\__,_|___/\__\___|_|   

module "single-node-cluster" {

  source = "./../../../terraform-aws-kubernetes-rke"
  //source = "john-morsley/kubernetes-rke/aws"

  cluster_name = var.cluster_name

  bucket_name = module.s3_bucket.name

  node_data = [{
    user                = "ubuntu"
    role                = ["controlplane", "etcd", "worker"]
    public_ip           = module.node-1.public_ip
    private_ip          = module.node-1.private_ip
    encoded_private_key = module.node-1.encoded_private_key
  }]

  depends_on = [
    module.vpc,
    module.node-1,
    module.allow-kube-api-sg,
    module.allow-http-sg
  ]

}