terraform {
  backend "s3" {
    bucket = "terraform-ecs-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
