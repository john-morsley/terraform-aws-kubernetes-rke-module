# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "get-shared-scripts" {

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/get_shared_scripts.sh"
    environment = {
      SHARED_SCRIPTS_FOLDER=local.shared_scripts_folder
    }
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "delete-shared-scripts" {

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/delete_shared_scripts.sh"
    when = destroy
  }

}