resource "aws_instance" "example" {
  ami           = "ami-06cffe063efe892ad"
  instance_type = "t2.micro"
}

 tags = {
    Name = "HelloWorld"
  }