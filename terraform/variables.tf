variable "private_repositories" {
  description = "Private repositories keyed by repository name."

  type = map(object({
    description                 = optional(string, "")
    homepage_url                = optional(string, "")
    topics                      = optional(set(string), [])
    has_issues                  = optional(bool, true)
    has_projects                = optional(bool, false)
    has_wiki                    = optional(bool, false)
    has_discussions             = optional(bool, false)
    allow_forking               = optional(bool, true)
    allow_merge_commit          = optional(bool, false)
    allow_rebase_merge          = optional(bool, false)
    allow_squash_merge          = optional(bool, true)
    allow_auto_merge            = optional(bool, true)
    allow_update_branch         = optional(bool, true)
    delete_branch_on_merge      = optional(bool, true)
    web_commit_signoff_required = optional(bool, false)
    squash_merge_commit_message = optional(string, "COMMIT_MESSAGES")
    squash_merge_commit_title   = optional(string, "COMMIT_OR_PR_TITLE")
    merge_commit_message        = optional(string, "PR_TITLE")
    merge_commit_title          = optional(string, "MERGE_MESSAGE")
  }))

  default = {}
}

variable "public_repositories" {
  description = "Public repositories keyed by repository name, including optional default-branch rulesets."

  type = map(object({
    description                 = optional(string, "")
    homepage_url                = optional(string, "")
    topics                      = optional(set(string), [])
    has_issues                  = optional(bool, true)
    has_projects                = optional(bool, false)
    has_wiki                    = optional(bool, false)
    has_discussions             = optional(bool, false)
    allow_forking               = optional(bool, true)
    allow_merge_commit          = optional(bool, false)
    allow_rebase_merge          = optional(bool, false)
    allow_squash_merge          = optional(bool, true)
    allow_auto_merge            = optional(bool, true)
    allow_update_branch         = optional(bool, true)
    delete_branch_on_merge      = optional(bool, true)
    web_commit_signoff_required = optional(bool, false)
    squash_merge_commit_message = optional(string, "COMMIT_MESSAGES")
    squash_merge_commit_title   = optional(string, "COMMIT_OR_PR_TITLE")
    merge_commit_message        = optional(string, "PR_TITLE")
    merge_commit_title          = optional(string, "MERGE_MESSAGE")
    rulesets = optional(map(object({
      enforcement            = optional(string, "active")
      include                = optional(set(string), ["~DEFAULT_BRANCH"])
      exclude                = optional(set(string), [])
      bypass_app_ids         = optional(set(number), [])
      prevent_creation       = optional(bool, false)
      prevent_update         = optional(bool, false)
      prevent_deletion       = optional(bool, true)
      prevent_force_push     = optional(bool, true)
      require_linear_history = optional(bool, false)
      require_signed_commits = optional(bool, false)
      pull_request = optional(object({
        required_approving_review_count   = optional(number, 0)
        dismiss_stale_reviews_on_push     = optional(bool, false)
        require_code_owner_review         = optional(bool, false)
        require_last_push_approval        = optional(bool, false)
        required_review_thread_resolution = optional(bool, false)
        allowed_merge_methods             = optional(list(string))
      }))
    })), {})
  }))

  default = {}
}
