resource "aws_eks_cluster" "eks" {
  name     = "${var.ws_name}_eks_cluster"
  role_arn = aws_iam_role.master.arn
  vpc_config {
    subnet_ids = [var.eks_sub1,var.eks_sub2]
    endpoint_private_access = true
    security_group_ids = [ aws_security_group.worker_sg.id ]
  }


  tags = {
    Name = "${var.ws_name}-eks"
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
  ]
}