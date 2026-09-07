variable "name" {
  description = "Repository name."
  type        = string
}

variable "repository" {
  description = "Repository settings."

  type = object({
    description                 = string
    homepage_url                = string
    topics                      = set(string)
    has_issues                  = bool
    has_projects                = bool
    has_wiki                    = bool
    has_discussions             = bool
    allow_forking               = bool
    allow_merge_commit          = bool
    allow_rebase_merge          = bool
    allow_squash_merge          = bool
    allow_auto_merge            = bool
    allow_update_branch         = bool
    delete_branch_on_merge      = bool
    web_commit_signoff_required = bool
    squash_merge_commit_message = string
    squash_merge_commit_title   = string
    merge_commit_message        = string
    merge_commit_title          = string
  })
}
