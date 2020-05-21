#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  kube_config_filename = "kube-config.yaml"

  shared_scripts_folder = "shared-scripts-${random_pet.shared-scripts.id}"
  
}