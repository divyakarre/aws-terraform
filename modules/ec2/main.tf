module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = var.vmname
  instance_count = 1

  ami                    = var.ami
  instance_type          = var.instancetype
  #vpc_security_group_ids = var.vpc_security_group_ids #[module.vpc.default_security_group_id]
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}