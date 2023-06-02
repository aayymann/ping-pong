resource "aws_eip" "eks-nat-gateway-aws_eip" {
  vpc = true
}

resource "aws_nat_gateway" "eks-nat-gateway" {
  allocation_id = aws_eip.eks-nat-gateway-aws_eip.id
  subnet_id     = aws_subnet.eks-vpc-public-subnet-1.id
  tags = {
    Name = "ping-pong-nat-gateway"
  }

  depends_on = [aws_internet_gateway.eks-igw]
}