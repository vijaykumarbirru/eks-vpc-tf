terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }

  # (Optional) Remote state
  # backend "s3" {
  #   bucket         = "my-tfstate-bucket"
  #   key            = "infra/dev/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "tf-lock-table"
  #   encrypt        = true
  # }
}
