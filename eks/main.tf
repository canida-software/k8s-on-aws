provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

# Check out more details about the module at https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/.
module "eks" {
  source = "registry.terraform.io/terraform-aws-modules/eks/aws"
  version = "18.26.3"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.kubernetes_version

  # EKS Addons for essential cluster services managed by AWS but running on the kubelets.
  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"

    }
  }


  # Creates an oidc provider to enable "IAM Roles for Service Accounts"
  enable_irsa = true

  node_security_group_additional_rules = {
    ingress_cluster = {
      description                = "From cluster to node"
      protocol                   = "-1"
      from_port                  = 0
      to_port                    = 0
      type                       = "ingress"
      source_cluster_security_group = true
    }

    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }

    ingress_ssh = {
      description = "SSH access to nodes"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      type        = "ingress"
      # Enable ssh access from private networks.
      cidr_blocks      = [
        "10.0.0.0/8",
        "172.16.0.0/12",
        "192.168.0.0/16",
      ]
    }

    egress_internet_all = {
      description      = "Egress all"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  }

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type     = "AL2_x86_64"

    # enables permissions for ssm access to ssh into your public and private instances.
    iam_role_additional_policies = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  }

  eks_managed_node_groups = var.eks_managed_node_groups
}