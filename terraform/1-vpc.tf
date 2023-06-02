resource "aws_vpc" "eks-vpc" {
  cidr_block = var.eks-vpc_cidr_block
  tags = {
    Name = "ping-pong"
  }
}
