#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|

output "export_kubeconfig_command" {
  value = module.multiple-node-cluster.export_kubeconfig_command
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = module.multiple-node-cluster.kubectl_get_nodes_kubeconfig_command
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = module.multiple-node-cluster.kubectl_get_all_pods_kubeconfig_command
}

output "bucket_name" {
  value = local.bucket_name
}

output "node_data" {
  value = module.multiple-node-cluster.node_data
}

output "ssh_commands" {
  value = module.multiple-node-cluster.ssh_commands
}

output "network-load_balancer_url" {
  value = module.multiple-node-cluster.network_load_balancer_url
}