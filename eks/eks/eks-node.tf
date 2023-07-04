resource "aws_eks_node_group" "ng" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.ws_name}_eks_ng"
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [var.eks_sub1,var.eks_sub2]
  ami_type = "AL2_x86_64"

  disk_size = "20"
  instance_types = ["t2.small"]

  scaling_config {
    desired_size = var.nodes_desired_size
    max_size     = var.nodes_max_size
    min_size     = var.nodes_min_size
  }
  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_eks_cluster.eks
  ]
}