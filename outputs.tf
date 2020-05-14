#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|                  

output "rke_ec2_data" {
  value = var.ec2_data
}

output "export_kubeconfig_command" {
  value = "export KUBECONFIG=k8s/${local.kube_config_filename}"
}

output "kubectl_kubeconfig_command" {
  value = "kubectl get nodes --kubeconfig=k8s/${local.kube_config_filename}"
}