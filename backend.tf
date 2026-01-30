terraform {
  backend "s3" {
    bucket = "tf-state-siva-01292026"
    key    = "dev-cs/terraform.tfstate"
    region = "us-west-1"
    encrypt = true
    use_lockfile = true
  }
}