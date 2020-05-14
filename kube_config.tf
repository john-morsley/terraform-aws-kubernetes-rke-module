#      _  __     _           _____             __ _        
#     | |/ /    | |         / ____|           / _(_)       
#     | ' /_   _| |__   ___| |     ___  _ __ | |_ _  __ _  
#     |  <| | | | '_ \ / _ \ |    / _ \| '_ \|  _| |/ _` | 
#     | . \ |_| | |_) |  __/ |___| (_) | | | | | | | (_| | 
#     |_|\_\__,_|_.__/ \___|\_____\___/|_| |_|_| |_|\__, | 
#                                                    __/ | 
#                                                   |___/  

resource "local_file" "kube-config-yaml" {
  filename = "./k8s/${local.kube_config_filename}"
  content  = rke_cluster.this.kube_config_yaml
}