#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

module "kube-config-yaml" {

  source = "./../terraform-aws-s3-object-module"
  #source = "john-morsley/s3-object/aws"

  bucket_name = var.bucket_name

  key     = "/kube_config.yaml"
  content = rke_cluster.this.kube_config_yaml

}