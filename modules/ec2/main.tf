resource "aws_instance" "web" {
  ami           = "ami-08d20da2261ebe2ec"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

