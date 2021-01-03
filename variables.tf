/*
__      __        _       _     _           
\ \    / /       (_)     | |   | |          
 \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
  \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
   \  / (_| | |  | | (_| | |_) | |  __/\__ \
    \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

                                          */

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "availability_zone_names" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "node_settings" {
  type = list(
    object({
      role          = list(string)
      instance_type = string
    })
  )
  default = []
}