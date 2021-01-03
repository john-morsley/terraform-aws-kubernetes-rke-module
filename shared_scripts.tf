/*
   _____ _                        _    _____           _       _       
  / ____| |                      | |  / ____|         (_)     | |      
 | (___ | |__   __ _ _ __ ___  __| | | (___   ___ _ __ _ _ __ | |_ ___ 
  \___ \| '_ \ / _` | '__/ _ \/ _` |  \___ \ / __| '__| | '_ \| __/ __|
  ____) | | | | (_| | | |  __/ (_| |  ____) | (__| |  | | |_) | |_\__ \
 |_____/|_| |_|\__,_|_|  \___|\__,_| |_____/ \___|_|  |_| .__/ \__|___/
                                                        | |            
                                                        |_|          */

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "get-shared-scripts" {

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/get_shared_scripts.sh"
    environment = {
      SHARED_SCRIPTS_FOLDER = local.shared_scripts_folder
    }
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "delete-shared-scripts" {

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/delete_shared_scripts.sh"
    when    = destroy
  }

}