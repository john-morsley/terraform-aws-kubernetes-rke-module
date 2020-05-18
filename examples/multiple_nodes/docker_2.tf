#      _____             _
#     |  __ \           | |
#     | |  | | ___   ___| | _____ _ __
#     | |  | |/ _ \ / __| |/ / _ \ '__|
#     | |__| | (_) | (__|   <  __/ |
#     |_____/ \___/ \___|_|\_\___|_|

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "install-docker-node-2" {

  depends_on = [
    module.vpc,
    module.node-2,
    module.allow-ssh
  ]

  connection {
    type        = "ssh"
    host        = module.node-2.public_ip
    user        = "ubuntu"
    private_key = base64decode(module.node-2.encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.module}/install_docker.sh"
    destination = "install_docker.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x install_docker.sh && bash install_docker.sh"]
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-docker-ready-node-2" {

  depends_on = [
    null_resource.install-docker-node-2
  ]

  connection {
    type        = "ssh"
    host        = module.node-2.public_ip
    user        = "ubuntu"
    private_key = base64decode(module.node-2.encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.module}/is_docker_ready.sh"
    destination = "is_docker_ready.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x is_docker_ready.sh && bash is_docker_ready.sh"]
  }

}