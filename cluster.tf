# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-cluster-ready" {

  depends_on = [
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
    command = "bash ${path.module}/scripts/is_cluster_ready.sh"
    environment = {
      KUBE_CONFIG_FOLDER = "${path.cwd}/k8s"
      CURRENT_FOLDER = "${path.module}"
    }
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
    command = "bash ${path.module}/scripts/are_deployments_ready.sh"
    environment = {
      KUBE_CONFIG_FOLDER = "${path.cwd}/k8s"
      CURRENT_FOLDER = "${path.module}"
    }
  }

}