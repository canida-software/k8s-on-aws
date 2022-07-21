# -----------------------------------------------------------------------------
# General
# -----------------------------------------------------------------------------

variable "region" {
  description = "eu-central-1"
}

variable "environment" {
  description = "The deployment environment"
}

variable "default_tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}


# -----------------------------------------------------------------------------
# Networking
# -----------------------------------------------------------------------------

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnet_count" {
  type        = number
  description = "The number of public subnets that should be created."
}

variable "private_subnet_count" {
  type        = number
  description = "The number of private subnets that should be created."
}
