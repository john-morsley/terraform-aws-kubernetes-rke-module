#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|

output "export_kubeconfig_command" {
  value = module.single-node-cluster.export_kubeconfig_command
}

output "kubectl_get_nodes_command" {
  value = module.single-node-cluster.kubectl_get_nodes_kubeconfig_command
}

output "kubectl_get_all_pods_command" {
  value = module.single-node-cluster.kubectl_get_all_pods_kubeconfig_command
}

output "bucket_name" {
  value = local.bucket_name
}

//output "node_settings" {
//  value = module.single-node-cluster.node_settings
//}

//output "node_outputs" {
//  value = module.single-node-cluster.node_outputs
//}

output "node_data" {
  value = module.single-node-cluster.node_data
}

output "ssh_commands" {
  value = module.single-node-cluster.ssh_commands
}

//output "kubeconfig_yaml" {
//  value = module.single-node-cluster.kubeconfig_yaml
//}

output "network-load_balancer_url" {
  value = module.single-node-cluster.network_load_balancer_url
}