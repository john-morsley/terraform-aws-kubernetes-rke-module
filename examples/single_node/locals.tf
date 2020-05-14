#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0" # All possible IP address range
  
  bucket_name = "single-node-example-${random_pet.bucket.id}"

  cluster_name = "single-node-example-${random_pet.name.id}"

  cluster_id_tag = {
    "kubernetes.io/cluster/${local.cluster_name}" = "owned" 
  }
  
}