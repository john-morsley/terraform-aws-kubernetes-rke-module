#       _____ _           _            
#      / ____| |         | |           
#     | |    | |_   _ ___| |_ ___ _ __ 
#     | |    | | | | / __| __/ _ \ '__|
#     | |____| | |_| \__ \ ||  __/ |   
#      \_____|_|\__,_|___/\__\___|_|   

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-cluster-ready" {

  depends_on = [
    null_resource.get-shared-scripts,
    rke_cluster.this,
    local_file.kube-config-yaml
  ]

  connection {
    type        = "ssh"
    host        = var.ec2_data[0].public_ip
    user        = "ubuntu"
    private_key = base64decode(var.ec2_data[0].encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.cwd}/shared-scripts/kubernetes/is_cluster_ready.sh ${path.cwd}/k8s/kube-config.yaml"
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "are_deployments_ready" {

  depends_on = [
    null_resource.is-cluster-ready
  ]

  connection {
    type        = "ssh"
    host        = var.ec2_data[0].public_ip
    user        = "ubuntu"
    private_key = base64decode(var.ec2_data[0].encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.cwd}/shared-scripts/kubernetes/are_deployments_ready.sh ${path.cwd}/k8s/kube-config.yaml"
  }

}