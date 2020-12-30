#      _______                   __                     
#     |__   __|                 / _|                    
#        | | ___ _ __ _ __ __ _| |_ ___  _ __ _ __ ___  
#        | |/ _ \ '__| '__/ _` |  _/ _ \| '__| '_ ` _ \ 
#        | |  __/ |  | | | (_| | || (_) | |  | | | | | |
#        |_|\___|_|  |_|  \__,_|_| \___/|_|  |_| |_| |_|

terraform {

  required_version = ">= 0.14"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    # https://registry.terraform.io/providers/hashicorp/local/latest
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    # https://registry.terraform.io/providers/hashicorp/null/latest
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    # https://registry.terraform.io/providers/hashicorp/random/latest
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    # https://registry.terraform.io/providers/rancher/rke/latest
    rke = {
      source  = "rancher/rke"
      version = "~> 1.0"
    }
  }

  # AWS requires the following environment variables:

  # AWS_DEFAULT_REGION
  # AWS_ACCESS_KEY_ID
  # AWS_SECRET_ACCESS_KEY

  backend "s3" {
    bucket         = "morsley-io-terraform-backend-states"
    key            = "terraform-modules/examples/aws-kubernetes-rke/multiple-node"
    region         = "eu-west-2"
    dynamodb_table = "morsley-io-terraform-state-locks"
    encrypt        = true
  }

}