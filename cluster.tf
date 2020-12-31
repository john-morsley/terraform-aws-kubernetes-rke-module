#       _____ _           _            
#      / ____| |         | |           
#     | |    | |_   _ ___| |_ ___ _ __ 
#     | |    | | | | / __| __/ _ \ '__|
#     | |____| | |_| \__ \ ||  __/ |   
#      \_____|_|\__,_|___/\__\___|_|   

resource "rke_cluster" "this" {

  cluster_name = var.cluster_name

  disable_port_check = false

  ignore_docker_version = true

  dynamic "nodes" {
    for_each = local.node_data

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

  //depends_on = [var.mock_depends_on]

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-cluster-ready" {
  
  connection {
    type        = "ssh"
    host        = local.node_data[0].public_ip
    user        = "ubuntu"
    private_key = base64decode(local.node_data[0].encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.cwd}/${local.shared_scripts_folder}/kubernetes/is_cluster_ready.sh ${path.cwd}/k8s/kubeconfig.yaml"
  }

  depends_on = [
    null_resource.get-shared-scripts,
    rke_cluster.this,
    local_file.kube-config-yaml
  ]

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "are_deployments_ready" {
  
  connection {
    type        = "ssh"
    host        = local.node_data[0].public_ip
    user        = "ubuntu"
    private_key = base64decode(local.node_data[0].encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.cwd}/${local.shared_scripts_folder}/kubernetes/are_deployments_ready.sh ${path.cwd}/k8s/kubeconfig.yaml"
  }

  depends_on = [
    null_resource.get-shared-scripts,
    null_resource.is-cluster-ready
  ]

}

//resource "null_resource" "is_default_backend_there" {
//  
//  # https://www.terraform.io/docs/provisioners/local-exec.html
//
//  provisioner "local-exec" {
//    command = "bash ${path.cwd}/${local.shared_scripts_folder}/aws/is_load_balancer_ready.sh ${aws_lb.node-nlb.arn}"
//  }
//
//  depends_on = [
//    null_resource.are_deployments_ready
//  ]
//  
//}