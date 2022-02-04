resource "aws_instance" "web" {
  ami           = "ami-078278691222aee06"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

