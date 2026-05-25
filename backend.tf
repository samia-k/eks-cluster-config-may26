terraform {
  backend "s3" {
    bucket = "eks-manual-config-may26"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    //use_lockfile   = true      
    encrypt = true
  }
}