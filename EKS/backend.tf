terraform {
  backend "s3" {
    bucket         = "terraformjenkis-demo-bucket"
    dynamodb_table = "terraformjenkins-db"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
  }
}