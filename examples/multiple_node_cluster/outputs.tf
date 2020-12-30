#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|



//output "private_ip_node" {
//  value = module.nodes.*.private_ip
//}
//
//output "node_data1" {
//  value = [
//    for node in module.nodes :
//    node.public_ip
//    //node.private_ip
//  ]
//}

output "nodes" {
  value = module.nodes
}

output "node_ids" {
  value = module.nodes.*.id
}

//output "node_ids_as_map" {
//  value = tomap(module.nodes.id)
//}

output "node_ids_as_set" {
  value = toset(module.nodes.*.id)
}


//output "private_node_ips" {
//  value = coalescelist(module.nodes[*].private_ip)
//}

//output "node_data" {
//  value = [
//    for node in module.nodes: {
//      user                = "ubuntu"
//      role                = ["controlplane", "etcd", "worker"]
//      public_ip           = node.public_ip
//      private_ip          = node.private_ip
//      encoded_private_key = node.encoded_private_key
//    }
//  ]
//}

//output "node_data" {
//  value = module.multiple-node-cluster.node_data
//}

output "load_balancer_url" {
  value = aws_lb.nodes.dns_name
}

/*
ec2_data = [
  {
    user                = "ubuntu"
    role                = ["controlplane", "etcd", "worker"]
    public_ip           = module.node-1.public_ip
    private_ip          = module.node-1.private_ip
    encoded_private_key = module.node-1.encoded_private_key
  },
  {
    user                = "ubuntu"
    role                = ["controlplane", "etcd", "worker"]
    public_ip           = module.node-2.public_ip
    private_ip          = module.node-2.private_ip
    encoded_private_key = module.node-2.encoded_private_key
  }
]
*/

//output "node_data2" {
//  value = [
//  for_each = module.nodes
//  name = each.key
//  //node.private_ip
//  ]
//}


//output "private_ip_node_1" {
//  value = module.node-1.private_ip
//}
//
//output "private_ip_node-2" {
//  value = module.node-2.private_ip
//}

//output "public_key" {
//  value = base64decode(module.node-1.encoded_public_key)
//}
//
//output "private_key" {
//  value = base64decode(module.node-1.encoded_private_key)
//}

//output "public_ip_node_1" {
//  value = module.node-1.public_ip
//}
//
//output "public_ip_node_2" {
//  value = module.node-2.public_ip
//}
//
//output "public_dns_node_1" {
//  value = module.node-1.public_dns
//}
//
//output "public_dns_node_2" {
//  value = module.node-2.public_dns
//}
//
//output "ssh_command_node_1" {
//  value = module.node-1.ssh_command
//}
//
//output "ssh_command_node_2" {
//  value = module.node-2.ssh_command
//}
//
output "export_kubeconfig_command" {
  value = module.multiple-node-cluster.export_kubeconfig_command
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = module.multiple-node-cluster.kubectl_get_nodes_kubeconfig_command
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = module.multiple-node-cluster.kubectl_get_all_pods_kubeconfig_command
}

//output "bucket_name" {
//  value = local.bucket_name
//}