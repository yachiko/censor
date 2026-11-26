module "repository_private" {
  for_each = var.private_repositories
  source   = "./modules/repository_private"

  name       = each.key
  repository = each.value
}

module "repository_public" {
  for_each = var.public_repositories
  source   = "./modules/repository_public"

  name       = each.key
  repository = each.value
  rulesets   = each.value.rulesets
}

# Temporary: adopts the existing censor repository. Remove after it is applied.
import {
  to = module.repository_public["censor"].github_repository.this
  id = "censor"
}
