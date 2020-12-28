#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|

output "private_ip_node-1" {
  value = module.node-1.private_ip
}

//output "public_key" {
//  value = base64decode(module.node-1.encoded_public_key)
//}
//
//output "private_key" {
//  value = base64decode(module.node-1.encoded_private_key)
//}

output "public_ip_node_1" {
  value = module.node-1.public_ip
}

output "public_dns_node_1" {
  value = module.node-1.public_dns
}

output "ssh_command_node_1" {
  value = module.node-1.ssh_command
}

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