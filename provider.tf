# ! linking to your aws account here so that terraform can create resources in your account (4h25min)
provider "aws" {
  region                   = "eu-west-1"
  shared_credentials_files = ["/Users/rahulwagh/.aws/credentials"]   # ! create your own credentials file and provide the path here
}