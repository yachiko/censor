resource "github_repository" "this" {
  name         = var.name
  description  = var.repository.description
  homepage_url = var.repository.homepage_url
  visibility   = "public"
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

resource "github_repository_ruleset" "this" {
  for_each = var.rulesets

  name        = each.key
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = each.value.enforcement

  conditions {
    ref_name {
      include = each.value.include
      exclude = each.value.exclude
    }
  }

  # The account owner is a repository administrator and can recover from a
  # misconfigured ruleset without weakening rules for other contributors.
  bypass_actors {
    actor_id    = 5
    actor_type  = "RepositoryRole"
    bypass_mode = "always"
  }

  # GitHub Apps that publish directly to the default branch, such as release
  # bots, bypass the ruleset by App ID.
  dynamic "bypass_actors" {
    for_each = each.value.bypass_app_ids

    content {
      actor_id    = bypass_actors.value
      actor_type  = "Integration"
      bypass_mode = "always"
    }
  }

  rules {
    creation                = each.value.prevent_creation
    update                  = each.value.prevent_update
    deletion                = each.value.prevent_deletion
    non_fast_forward        = each.value.prevent_force_push
    required_linear_history = each.value.require_linear_history
    required_signatures     = each.value.require_signed_commits

    dynamic "pull_request" {
      for_each = each.value.pull_request == null ? [] : [each.value.pull_request]

      content {
        required_approving_review_count   = pull_request.value.required_approving_review_count
        dismiss_stale_reviews_on_push     = pull_request.value.dismiss_stale_reviews_on_push
        require_code_owner_review         = pull_request.value.require_code_owner_review
        require_last_push_approval        = pull_request.value.require_last_push_approval
        required_review_thread_resolution = pull_request.value.required_review_thread_resolution
        allowed_merge_methods             = pull_request.value.allowed_merge_methods
      }
    }
  }
}
