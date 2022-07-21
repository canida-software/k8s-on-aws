# -----------------------------------------------------------------------------
# AWS
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "default_tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}


# -----------------------------------------------------------------------------
# General
# -----------------------------------------------------------------------------

variable "project_name" {
  description = "Project name which is used to prefix all roles."
  type = string
}


# -----------------------------------------------------------------------------
# OIDC
# -----------------------------------------------------------------------------

variable "oidc_url" {
  description = "OIDC Provider URL"
  type = string
}
