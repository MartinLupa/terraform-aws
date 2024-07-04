resource "aws_instance" "ec2" {
  ami           = "ami-0910ce22fbfa68e1d" # Amazon Linux in eu-west-1, update as per your region
  instance_type = "t2.micro"

  # The user_data attribute allows you to provide a script that will be executed on the instance at launch. 
  # The file function reads the contents of the specified file (webapp-install.sh located in the module's path) 
  # and passes it as a string to user_data.
  user_data = file("${path.module}/webapp-install.sh")

  tags = {
    Name = "webapp-ec2-instance"
  }
}
