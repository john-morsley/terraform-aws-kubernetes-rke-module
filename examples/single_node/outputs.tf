#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|

output "private_ip" {
  value = module.node-1.private_ip
}

output "private_key" {
  value = base64decode(module.node-1.encoded_private_key)
}

output "public_ip" {
  value = module.node-1.public_ip
}

output "public_dns" {
  value = module.node-1.public_dns
}

output "ssh_command" {
  value = module.node-1.ssh_command
}