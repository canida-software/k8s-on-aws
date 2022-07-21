terraform {
  backend "s3" {
    bucket = "canida-terraform"
    key    = "k8s-main/iam-roles.tfstate"
    region = "eu-central-1"
  }
}

