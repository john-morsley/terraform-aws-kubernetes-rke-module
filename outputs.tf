#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|                  

output "export_kubeconfig_command" {
  value = "export KUBECONFIG=k8s/kubeconfig.yaml"
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = "kubectl get no --output=wide --kubeconfig=k8s/kubeconfig.yaml"
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = "kubectl get po --all-namespaces --output=wide --kubeconfig=k8s/kubeconfig.yaml"
}

output "kubeconfig_yaml" {
  value = rke_cluster.this.kube_config_yaml
}

output "node_settings" {
  value = var.node_settings
}

output "node_outputs" {
  value = local.node_outputs
}

output "node_data" {
  value = local.node_data
}

output "ssh_commands" {
  value = [
    for node in module.nodes: {
      node = node.name
      ssh_command = node.ssh_command
    }
  ]
}

output "network-load_balancer_url" {
  value = aws_lb.node-nlb.dns_name
}