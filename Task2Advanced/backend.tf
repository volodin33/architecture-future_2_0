terraform {
  required_version = ">= 1.3.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2"
    }
  }

  backend "s3" {
    bucket = "tfstate"
    key    = "task2/terraform.tfstate"
    region = "us-east-1"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    use_path_style              = true
  }
}
