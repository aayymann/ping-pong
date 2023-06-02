resource "aws_route_table" "eks-private-route-table" {
  vpc_id = aws_vpc.eks-vpc.id
  tags = {
    Name = "ping-pong-private-route-table"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-nat-gateway.id
  }
}

resource "aws_route_table" "eks-public-route-table" {
  vpc_id = aws_vpc.eks-vpc.id
  tags = {
    Name = "ping-pong-public-route-table"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }
}

// Route Table Association
resource "aws_route_table_association" "eks-private-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.eks-vpc-private-subnet-1.id
  route_table_id = aws_route_table.eks-private-route-table.id
}

resource "aws_route_table_association" "eks-private-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.eks-vpc-private-subnet-2.id
  route_table_id = aws_route_table.eks-private-route-table.id
}

resource "aws_route_table_association" "eks-public-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.eks-vpc-public-subnet-1.id
  route_table_id = aws_route_table.eks-public-route-table.id
}

resource "aws_route_table_association" "eks-public-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.eks-vpc-public-subnet-2.id
  route_table_id = aws_route_table.eks-public-route-table.id
}