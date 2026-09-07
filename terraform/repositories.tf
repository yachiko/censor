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

# Import blocks make onboarding existing repositories reviewable and repeatable.
import {
  for_each = var.private_repositories

  to = module.repository_private[each.key].github_repository.this
  id = "Yachiko/${each.key}"
}

import {
  for_each = var.public_repositories

  to = module.repository_public[each.key].github_repository.this
  id = "Yachiko/${each.key}"
}
