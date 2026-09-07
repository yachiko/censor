variable "repositories" {
  description = "Private repositories managed by this configuration, keyed by repository name."

  type = map(object({
    description            = optional(string, "")
    homepage_url           = optional(string, "")
    topics                 = optional(set(string), [])
    has_issues             = optional(bool, true)
    has_projects           = optional(bool, false)
    has_wiki               = optional(bool, false)
    has_discussions        = optional(bool, false)
    allow_merge_commit     = optional(bool, false)
    allow_rebase_merge     = optional(bool, false)
    allow_squash_merge     = optional(bool, true)
    allow_auto_merge       = optional(bool, true)
    allow_update_branch    = optional(bool, true)
    delete_branch_on_merge = optional(bool, true)
    vulnerability_alerts   = optional(bool, true)
  }))

  default = {}
}
