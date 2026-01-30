provider "aws" {
  region = "us-west-1"
}

module "Vms_app1" {
  source = "git::https://github.com/sivanick88/tf-aws-modules-jan26-siva.git//ec2-instance?ref=main"
  region-1 = "us-west-1"
  instance_type = "t3.micro"
  subnets = ["subnet-084785ce11bb38827", "subnet-0e100c7e306c1812d"]
  num_of_vm = 1
  env = "dev"
  web_sg = [module.Web_SG01.web_sg_id]
  user_data = file ("scripts/nginx.sh")
}

module "Web_SG01" {
  source = "git::https://github.com/sivanick88/tf-aws-modules-jan26-siva.git//security-groups?ref=main"
  project = "Siva"
  vpc_id = data.aws_vpc.default.id
}

data "aws_vpc" "default" {
  default = true
}

output "vm_private_ips01" {
  value = module.Vms_app1.vm_priv_pips
}
