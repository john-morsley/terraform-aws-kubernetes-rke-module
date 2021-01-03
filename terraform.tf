/*
 _______                   __
|__   __|                 / _|
   | | ___ _ __ _ __ __ _| |_ ___  _ __ _ __ ___
   | |/ _ \ '__| '__/ _` |  _/ _ \| '__| '_ ` _ \
   | |  __/ |  | | | (_| | || (_) | |  | | | | | |
   |_|\___|_|  |_|  \__,_|_| \___/|_|  |_| |_| |_|

                                                */

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

}