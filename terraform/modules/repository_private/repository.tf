resource "github_repository" "this" {
  name         = var.name
  description  = var.repository.description
  homepage_url = var.repository.homepage_url
  visibility   = "private"
  topics       = var.repository.topics

  has_issues      = var.repository.has_issues
  has_projects    = var.repository.has_projects
  has_wiki        = var.repository.has_wiki
  has_discussions = var.repository.has_discussions

  allow_forking               = var.repository.allow_forking
  allow_merge_commit          = var.repository.allow_merge_commit
  allow_rebase_merge          = var.repository.allow_rebase_merge
  allow_squash_merge          = var.repository.allow_squash_merge
  allow_auto_merge            = var.repository.allow_auto_merge
  allow_update_branch         = var.repository.allow_update_branch
  delete_branch_on_merge      = var.repository.delete_branch_on_merge
  web_commit_signoff_required = var.repository.web_commit_signoff_required
  squash_merge_commit_message = var.repository.squash_merge_commit_message
  squash_merge_commit_title   = var.repository.squash_merge_commit_title
  merge_commit_message        = var.repository.merge_commit_message
  merge_commit_title          = var.repository.merge_commit_title

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_issue_label" "dependencies" {
  repository  = github_repository.this.name
  name        = "dependencies"
  color       = "0366d6"
  description = "Pull requests that update a dependency file"
}
