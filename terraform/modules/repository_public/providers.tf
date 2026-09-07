# tflint-ignore-file: terraform_required_providers
# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}
