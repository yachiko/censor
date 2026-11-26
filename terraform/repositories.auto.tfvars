# Imported from the yachiko account on 2026-09-07; synced 2026-11-26.
# These values mirror the current GitHub repository settings.
private_repositories = {
  remora = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
  }

  opifex = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
  }

  arbiter = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
  }

  experiment = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
  }

  tabellarius = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
  }
}

public_repositories = {
  fossor = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
    rulesets = {
      primary = {
        enforcement = "disabled"
        pull_request = {
          required_approving_review_count = 1
          require_code_owner_review       = true
          allowed_merge_methods           = ["merge", "squash", "rebase"]
        }
      }
    }
  }

  spotalis = {
    description            = "Annotation‑first spot vs on‑demand replica optimizer for Kubernetes"
    has_projects           = true
    has_wiki               = true
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
    rulesets = {
      main = {
        prevent_creation   = true
        prevent_update     = true
        prevent_force_push = false
        pull_request = {
          required_approving_review_count   = 1
          require_code_owner_review         = true
          required_review_thread_resolution = true
          allowed_merge_methods             = ["merge", "squash", "rebase"]
        }
      }
    }
  }

  clerk = {
    has_projects           = true
    has_wiki               = true
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
    rulesets = {
      main = {
        pull_request = {
          required_approving_review_count = 1
          allowed_merge_methods           = ["squash", "rebase"]
        }
      }
    }
  }

  homebrew-tap = {
    has_projects           = true
    has_wiki               = true
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
    rulesets = {
      protect-main = {
        # yachiko-homebrew-bot publishes release formulas directly to main.
        bypass_app_ids = [3887177]
        pull_request = {
          required_approving_review_count = 1
          require_code_owner_review       = true
        }
      }
    }
  }

  circitor = {
    has_projects           = true
    has_wiki               = false
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
    rulesets = {
      "Protect main" = {}
    }
  }

  lege = {
    has_projects           = true
    has_wiki               = true
    allow_merge_commit     = true
    allow_rebase_merge     = true
    allow_squash_merge     = true
    allow_auto_merge       = false
    allow_update_branch    = false
    delete_branch_on_merge = false
    rulesets = {
      "Protect main" = {}
    }
  }
}
