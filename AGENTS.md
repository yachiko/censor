# AGENTS.md

## Project Scope

This repository manages the `yachiko` GitHub account through Terraform. The
Terraform root is `terraform/`; run all Make targets from the repository root.

## Repository Model

- Keep public repositories in `public_repositories` and private repositories in
  `private_repositories` in `terraform/repositories.auto.tfvars`.
- Use `repository_public` and `repository_private` modules rather than adding
  raw `github_repository` resources at the root.
- Public repository rulesets belong in the public repository's `rulesets` map.
  Private personal repositories cannot use rulesets without GitHub Pro.
- Public rulesets protect the default branch and permit repository
  administrators to bypass the ruleset for recovery.
- Internal modules use the provider version constrained by the Terraform root;
  do not add module-local provider version constraints.

## State And Credentials

- Terraform state is stored in R2. Keep `terraform/backend.hcl`, state files,
  plans, and credentials out of Git.
- Supply R2 credentials through `AWS_ACCESS_KEY_ID` and
  `AWS_SECRET_ACCESS_KEY`; supply GitHub credentials through `GITHUB_TOKEN`.
- Never add a credential value to Terraform configuration, documentation, CI,
  or a commit.
- CI validates only. Never add automated Terraform plans or applies to CI.

## Required Checks

Before creating a pull request, these commands must pass locally:

```sh
make fmt
make validate
make lint
```

Review `make plan` output before running `make apply`. `make apply` must only
consume the reviewed `terraform/plan.out` produced by `make plan`.
