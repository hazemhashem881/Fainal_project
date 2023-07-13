#------create aws ec2 ---

resource "aws_instance" "bastion" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = module.network.pub_subnet1_id
  key_name = var.ssh_key
  associate_public_ip_address = true
  user_data = file("config.sh")
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name ="bastion"
  }
}

resource "null_resource" "ssh-bastion" {

  #ssh into ec2 instance
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/Desktop/ec2.pem")
    host = aws_instance.bastion.public_ip
  }
  #copy the k8s files  from your computer to ec2 instance
  provisioner "file"{
    source = "k8s"
    destination = "/home/ubuntu"
  }
  # set permissions and run the kubectl apply.sh file
provisioner "remote-exec" {
  inline = [
    "sudo chmod +x /home/ubuntu/k8s/apply.sh",
  ]
}
}

