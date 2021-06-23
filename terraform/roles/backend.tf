terraform {
  backend "s3" {
    key    = "roles.tfstate"
    region = "ap-northeast-1"
  }
}

