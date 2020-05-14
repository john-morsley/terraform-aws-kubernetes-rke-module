#      _____                   _       
#     |_   _|                 | |      
#       | |  _ __  _ __  _   _| |_ ___
#       | | | '_ \| '_ \| | | | __/ __|
#      _| |_| | | | |_) | |_| | |_\__ \
#     |_____|_| |_| .__/ \__,_|\__|___/
#                 | |                  
#                 |_|                  

variable "cluster_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "ec2_data" {
  type = list(
    object({
      user = string
      role = list(string)
      public_ip = string
      private_ip = string
      encoded_private_key = string
    })
  )
  default = []
}

variable "mock_depends_on" {
  type    = any
  default = null
}