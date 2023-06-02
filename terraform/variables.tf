
# AWS vars 
variable "aws_region" {
  type = string
}

variable "eks-vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block for EKS cluster"
}

variable "eks_private_subnet_1" {
  type = map(string)
}

variable "eks_private_subnet_2" {
  type = map(string)
}

variable "eks_public_subnet_1" {
  type = map(string)
}

variable "eks_public_subnet_2" {
  type = map(string)
}

variable "eks_cluster_name" {
  type = string
}


# K8s + Helm vars
variable "deployment_namespace" {
  type = string

  description = "Namespace the helm chart(s) will be deployed in"
  validation {
    condition     = length(var.deployment_namespace) < 63
    error_message = "Namespace must be less than 63 characters"
  }

  validation {
    condition     = length(var.deployment_namespace) > 1
    error_message = "Namespace must be at least 1 character"
  }

  default = "ping-pong"
}
