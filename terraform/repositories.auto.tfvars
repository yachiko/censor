# Imported from the yachiko account on 2026-09-07; synced 2026-11-26.
# These values mirror the current GitHub repository settings.
private_repositories = {
  remora = {
    description            = "Self-hosted GitHub App for natural-language issue and PR reminders"
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
    description            = "Static portfolio website built with Astro, Tailwind and React"
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
    description            = "Local-first, keyboard-first GitHub pull request review workspace"
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
    description            = "Sandbox for throwaway prototypes"
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
    description            = "Trading strategy research platform with AI-authored strategies and live alerts"
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
    description            = "Multi-repository Git dashboard for the terminal"
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
    description            = "CLI and k9s-style terminal UI for AWS Parameter Store secrets"
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
    description            = "Homebrew tap for yachiko's command-line and desktop tools"
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
    description            = "Local daemon that watches GitHub pull requests for coding agents"
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
    description            = "A minimal Markdown viewer"
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
