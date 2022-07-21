//AWS 
region      = "eu-central-1"
environment = "general"

default_tags = {
  owner    = "canida"
  project  = "general-vpc"
}

/* module networking */
vpc_cidr             = "10.55.0.0/16"
public_subnet_count = 3
private_subnet_count = 3
