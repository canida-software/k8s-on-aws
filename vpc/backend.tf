terraform {
  backend "s3" {
    bucket = "canida-terraform"
    key    = "general-vpc.tfstate"
    region = "eu-central-1"
  }
}
