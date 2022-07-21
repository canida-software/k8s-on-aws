terraform {
  backend "s3" {
    bucket = "canida-terraform"
    key    = "k8s-main.tfstate"
    region = "eu-central-1"
  }
}
