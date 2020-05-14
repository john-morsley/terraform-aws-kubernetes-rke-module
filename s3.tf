#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

resource "aws_s3_bucket_object" "kube-config-yaml" {

  //depends_on = [aws_s3_bucket.cluster]

  bucket     = var.bucket_name
  key        = "/${local.kube_config_filename}"
  content    = rke_cluster.this.kube_config_yaml
  content_type = "text/*"

}