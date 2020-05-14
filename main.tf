#      _____    _  __  ______ 
#     |  __ \  | |/ / |  ____|
#     | |__) | | ' /  | |__   
#     |  _  /  |  <   |  __|  
#     | | \ \  | . \  | |____ 
#     |_|  \_\ |_|\_\ |______|

# Rancher Kubernetes Engine

resource "rke_cluster" "this" {
  
  cluster_name = var.cluster_name

  disable_port_check = false

  ignore_docker_version = true

  dynamic "nodes" {

    for_each = var.ec2_data

    content {
      user = "ubuntu"
      role = nodes.value["role"]      
      address = nodes.value["public_ip"]
      internal_address = nodes.value["private_ip"]
      ssh_key = base64decode(nodes.value["encoded_private_key"])
    }

  }

  ############ #
  # Important! #
  # ############
  #
  # This parameter requires that a special tag has been added the following resources:
  # 1 - Each node (EC2) requires the tag.
  # 2 - The Subnet
  # 3 - The Security Group
  # The special tag is: "kubernetes.io/cluster/[Cluster Name]": "owned"
  cloud_provider {
    name = "aws"
  }

  depends_on = [ var.mock_depends_on ]
  
}