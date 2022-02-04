data "aws_ami" "ubuntu" {
  most_recent = true


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["756217852389"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "ami-078278691222aee06"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}