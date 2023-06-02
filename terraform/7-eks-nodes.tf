// Cluster role nodes for workder nodes to interact with AWS services
resource "aws_iam_role" "eks-nodes-cluster-role" {
  name = "eks-nodes-cluster-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

// Attach AmazonEKSWorkerNodePolicy to the nodes cluster role
resource "aws_iam_role_policy_attachment" "eks-nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-nodes-cluster-role.name
}

// Attach AmazonEKS_CNI_Policy to the nodes cluster role
resource "aws_iam_role_policy_attachment" "eks-nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-nodes-cluster-role.name
}

// Attach AmazonEC2ContainerRegistryReadOnly to the nodes cluster role
resource "aws_iam_role_policy_attachment" "eks-nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-nodes-cluster-role.name
}

// Create EKS cluster EC2 worker nodes
resource "aws_eks_node_group" "eks-worker-nodes" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "eks-worker-nodes"
  node_role_arn   = aws_iam_role.eks-nodes-cluster-role.arn

  subnet_ids = [
    aws_subnet.eks-vpc-private-subnet-1.id,
    aws_subnet.eks-vpc-private-subnet-2.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}