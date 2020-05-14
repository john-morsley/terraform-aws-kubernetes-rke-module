# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-cluster-ready" {

  depends_on = [
    rke_cluster.this,
    local_file.kube-config-yaml
  ]

  connection {
    type        = "ssh"
    //host        = aws_instance.k8s.public_ip
    host = var.ec2_data[0].public_ip
    user        = "ubuntu"
    //private_key = join("", tls_private_key.node_key.*.private_key_pem)
    private_key = base64decode(var.ec2_data[0].encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/is_cluster_ready.sh ${path.cwd}/k8s/${local.kube_config_filename}"
  }

}