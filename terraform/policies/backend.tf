terraform {
  backend "s3" {
    key = "policies.tfstate"
    region = "ap-northeast-1"
  }
}
