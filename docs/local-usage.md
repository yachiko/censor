# Local Usage

Run all commands from the repository root. Terraform configuration is in
`terraform/`; the Makefile selects that directory automatically.

## Credentials

Export credentials only into the current shell. Do not add them to Terraform
files, `backend.hcl`, Git, or CI.

```sh
export AWS_ACCESS_KEY_ID='R2 access key ID'
export AWS_SECRET_ACCESS_KEY='R2 secret access key'
export GITHUB_TOKEN="$(gh auth token)"
```

`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are the R2 S3 API credentials.
They are the Cloudflare credentials used by Terraform's S3 backend. `GITHUB_TOKEN`
must be able to administer every managed repository.

## Backend

Create `terraform/backend.hcl` with the following contents:

```hcl
# Credentials are read from AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
bucket = "yachiko-terraform-state"
key    = "censor/terraform.tfstate"
region = "auto"

endpoints = {
  s3 = "https://ACCOUNT_ID.r2.cloudflarestorage.com"
}

# R2 is S3-compatible but does not implement AWS account APIs.
skip_credentials_validation = true
skip_region_validation      = true
skip_requesting_account_id  = true
use_lockfile                = true
```

Replace `ACCOUNT_ID` with the account identifier from the R2 S3-compatible
endpoint. `terraform/backend.hcl` is ignored by Git and contains no credentials.

Initialize the backend after exporting the R2 variables:

```sh
make init
```

## Repository Inventory

`terraform/repositories.auto.tfvars` is versioned configuration, not a secret.
It separates public and private repository maps. Every repository in those
maps is already in state, so a new entry plans a new repository. To adopt a
repository that already exists on GitHub, add a temporary `import` block for it
(and for any existing ruleset or `dependencies` label), apply the reviewed plan,
then remove the block.

## Plan And Apply

```sh
make fmt
make lint
make plan
make apply
```

`make plan` writes `terraform/plan.out`. Review its output before proceeding.
`make apply` only consumes that saved plan and fails if it is absent.

## Rulesets

GitHub currently requires GitHub Pro to use repository rulesets on private
repositories owned by this personal account. Public repositories accept optional
default-branch rulesets through their `rulesets` map. Public rulesets always
allow repository administrators to bypass the ruleset. For example:

```hcl
public_repositories = {
  example = {
    rulesets = {
      "protect-main" = {
        pull_request = {
          required_approving_review_count = 1
        }
      }
    }
  }
}
```
