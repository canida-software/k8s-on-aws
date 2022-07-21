aws_region = "eu-central-1"
cluster_name = "k8s-main"
kubernetes_version = "1.22"
vpc_id                         = "vpc-XXX"
private_subnets                = ["subnet-XXX", "subnet-XXX", "subnet-XXX"]
default_tags = {
    owner    = "canida"
    project  = "k8s-main"
}

eks_managed_node_groups = {
  general = {
    min_size     = 3
    max_size     = 10
    # due to the widespread use of autoscaling this property is ignored after initial deployment.
    desired_size = 3
    instance_types = ["t3a.medium"]
    capacity_type  = "SPOT"
  }
}

