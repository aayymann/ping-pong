aws_region = "us-east-1"

eks-vpc_cidr_block = "10.0.0.0/16"

eks_private_subnet_1 = {
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-1a"
}

eks_private_subnet_2 = {
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-east-1b"
}

eks_public_subnet_1 = {
  cidr_block        = "10.0.64.0/19"
  availability_zone = "us-east-1a"
}

eks_public_subnet_2 = {
  cidr_block        = "10.0.96.0/19"
  availability_zone = "us-east-1b"
}

eks_cluster_name = "ping-pong"

deployment_namespace = "ping-pong"

