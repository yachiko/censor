resource "github_repository" "this" {
  for_each = var.repositories

  name         = each.key
  description  = each.value.description
  homepage_url = each.value.homepage_url
  visibility   = "private"
  topics       = each.value.topics

  has_issues      = each.value.has_issues
  has_projects    = each.value.has_projects
  has_wiki        = each.value.has_wiki
  has_discussions = each.value.has_discussions

  allow_merge_commit     = each.value.allow_merge_commit
  allow_rebase_merge     = each.value.allow_rebase_merge
  allow_squash_merge     = each.value.allow_squash_merge
  allow_auto_merge       = each.value.allow_auto_merge
  allow_update_branch    = each.value.allow_update_branch
  delete_branch_on_merge = each.value.delete_branch_on_merge
  vulnerability_alerts   = each.value.vulnerability_alerts

  lifecycle {
    prevent_destroy = true
  }
}

# Import blocks make onboarding existing repositories reviewable and repeatable.
import {
  for_each = var.repositories

  to = github_repository.this[each.key]
  id = "Yachiko/${each.key}"
}
