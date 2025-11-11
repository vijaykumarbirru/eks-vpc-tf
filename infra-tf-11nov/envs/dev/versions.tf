terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }

  # Optionally configure a remote backend here
  # backend "s3" {
  #   bucket = "my-tf-state-bucket"
  #   key    = "eks-platform/dev/terraform.tfstate"
  #   region = "us-east-1"
  #   dynamodb_table = "tf-locks"
  #   encrypt = true
  # }
}
