terraform {
  required_version = "~>1.11.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}