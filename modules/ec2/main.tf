resource "aws_instance" "example" {
  ami           = "ami-0d3907809e0f70e5d"
  instance_type = "t2.micro"
}

