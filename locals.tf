/*
 _                     _
| |                   | |
| |     ___   ___ __ _| |___
| |    / _ \ / __/ _` | / __|
| |___| (_) | (_| (_| | \__ \
|______\___/ \___\__,_|_|___/

                           */

locals {

  cluster_id_tag = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }

  shared_scripts_folder = "shared-scripts-${random_pet.shared-scripts.id}"

  node_outputs = [
    for node in module.nodes : {
      public_ip           = node.public_ip
      private_ip          = node.private_ip
      encoded_private_key = node.encoded_private_key
    }
  ]

  node_data = [
    for index, setting in var.node_settings :
    merge(setting, {
      "public_ip"           = local.node_outputs[index].public_ip
      "private_ip"          = local.node_outputs[index].private_ip
      "encoded_private_key" = local.node_outputs[index].encoded_private_key
    })
  ]

}