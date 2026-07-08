terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }

  backend "s3" {
    bucket = "remote-state-dev-267"
    key = "roboshop-dev-backend-alb"
    region = "us-east-1"
    encrypt = true 
    use_lockfile = true 
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}