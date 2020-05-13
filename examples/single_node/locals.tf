#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  bucket_name = "single-node-example-${random_pet.this.id}"

  cluster_name = "single-node-example-${random_pet.this.id}"

  cluster_id_tag = {
    "kubernetes.io/cluster/${local.cluster_name}" = "owned" 
  }

  all_cidr_block = "0.0.0.0/0" # All possible IP address range
  
}