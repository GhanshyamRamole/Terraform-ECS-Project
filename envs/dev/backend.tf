terraform {
  backend "s3" {
    bucket = "terraform-ecs-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
