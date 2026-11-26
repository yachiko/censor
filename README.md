# censor

*censor* (Latin): the Roman magistrate who kept the census, the register of every citizen and his property, and watched over their conduct.

Terraform configuration for every public and private repository owned by
`yachiko`, including default-branch rulesets on public repositories. CI only
formats, initializes without a backend, validates, and lints. All plans and
applies run locally.

Terraform configuration is in `terraform/`; run the documented `make` targets
from the repository root. See [local usage](docs/local-usage.md) for complete
credential, backend, plan, and apply instructions.

## Prerequisites

- Terraform 1.15.x
- TFLint
- An R2 bucket named `yachiko-terraform-state`, with public access disabled
- A GitHub fine-grained personal access token with administration access to the
  repositories being managed

## First-time setup

1. Create `terraform/backend.hcl` as described in
   [local usage](docs/local-usage.md#backend), replacing `ACCOUNT_ID` with the
   account ID in the S3-compatible R2 endpoint.
2. Confirm that every repository is listed in
   `terraform/repositories.auto.tfvars`. List repository names with:

   ```sh
   gh repo list Yachiko --limit 100 --json name --jq '.[].name'
   ```

3. Export credentials. Do not place these values in Terraform files:

   ```sh
   export AWS_ACCESS_KEY_ID='...'
   export AWS_SECRET_ACCESS_KEY='...'
   export GITHUB_TOKEN='...'
   ```

4. Initialize and review the plan:

   ```sh
   make init
   make plan
   ```

5. Reconcile repository settings in `terraform/repositories.auto.tfvars` until the
   plan contains only the intended changes, then apply the reviewed plan:

   ```sh
   make apply
   ```

`prevent_destroy` is enabled for every repository. Removing a repository from
the map cannot delete it accidentally.

## Routine checks

```sh
make fmt
make validate
make lint
```

`make apply` only accepts an existing `terraform/plan.out`; it never generates
a plan. Run `make plan` immediately before applying to ensure the saved plan is
current.
