resource "aws_subnet" "eks-vpc-private-subnet-1" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = var.eks_private_subnet_1.cidr_block
  availability_zone = var.eks_private_subnet_1.availability_zone
  tags = {
    "Name"                                          = "eks-vpc-private-subnet-1"
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}

resource "aws_subnet" "eks-vpc-private-subnet-2" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = var.eks_private_subnet_2.cidr_block
  availability_zone = var.eks_private_subnet_2.availability_zone
  tags = {
    "Name"                                          = "eks-vpc-private-subnet-2"
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}

resource "aws_subnet" "eks-vpc-public-subnet-1" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = var.eks_public_subnet_1.cidr_block
  availability_zone       = var.eks_public_subnet_1.availability_zone
  map_public_ip_on_launch = true
  tags = {
    "Name"                                          = "eks-vpc-public-subnet-1"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}

resource "aws_subnet" "eks-vpc-public-subnet-2" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = var.eks_public_subnet_2.cidr_block
  availability_zone       = var.eks_public_subnet_2.availability_zone
  map_public_ip_on_launch = true
  tags = {
    "Name"                                          = "eks-vpc-public-subnet-2"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}