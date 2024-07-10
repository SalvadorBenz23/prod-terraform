provider "aws" {
  region = var.region
}

provider "aws" {
  alias   = "school"
  profile = "school-account"
  region  = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-sapesu"    # S3 bucket name
    key            = "terraform.tfstate"         # Path to the state file inside the bucket
    region         = "eu-west-3"                 # AWS region
    encrypt        = true                        # Encrypt state file at rest (recommended)
  }
}