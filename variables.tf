
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

//variable "number_of_nodes" {
//  type    = number
//  default = 1
//}

variable "node_settings" {
  type = list(
    object({
      //user                = string
      role                = list(string)
      instance_type       = string
      //public_ip           = string
      //private_ip          = string
      //encoded_private_key = string
    })
  )
  default = []
}