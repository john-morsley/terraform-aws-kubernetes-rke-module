#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  //bucket_name = replace(var.cluster_name, ".", "-")
  
  kube_config_filename = "kube_config_cluster.yml"  
  
}