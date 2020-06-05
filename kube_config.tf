#      _          _                           __ _       
#     | |        | |                         / _(_)      
#     | | ___   _| |__   ___  ___ ___  _ __ | |_ _  __ _ 
#     | |/ / | | | '_ \ / _ \/ __/ _ \| '_ \|  _| |/ _` |
#     |   <| |_| | |_) |  __/ (_| (_) | | | | | | | (_| |
#     |_|\_\\__,_|_.__/ \___|\___\___/|_| |_|_| |_|\__, |
#                                                   __/ |
#                                                  |___/ 

resource "local_file" "kube-config-yaml" {
  filename = "./k8s/kube-config.yaml"
  content  = rke_cluster.this.kube_config_yaml
}