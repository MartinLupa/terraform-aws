resource "aws_instance" "ec2" {
  ami           = "ami-0910ce22fbfa68e1d" # Amazon Linux in eu-west-1, update as per your region
  instance_type = "t2.micro"
  user_data     = file("${path.module}/webapp-install.sh")

  tags = {
    Name = "webapp-ec2-instance"
  }
}
