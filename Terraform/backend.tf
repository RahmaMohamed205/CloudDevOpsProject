# =============================================================================
# S3 remote backend for Terraform state.
#
# Before the first `terraform init`, create the backend resources once:
#   aws s3api create-bucket --bucket ivolve-terraform-state-rahma --region us-east-1
#   aws s3api put-bucket-versioning --bucket ivolve-terraform-state-rahma \
#       --versioning-configuration Status=Enabled
#   aws dynamodb create-table --table-name ivolve-terraform-locks \
#       --attribute-definitions AttributeName=LockID,AttributeType=S \
#       --key-schema AttributeName=LockID,KeyType=HASH \
#       --billing-mode PAY_PER_REQUEST
#
# NOTE: the bucket name must be globally unique - replace it with your own
# before running `terraform init`.
# =============================================================================

terraform {
  backend "s3" {
    bucket         = "ivolve-terraform-state-rahma"
    key            = "cloud-devops-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ivolve-terraform-locks"
    encrypt        = true
  }
}
