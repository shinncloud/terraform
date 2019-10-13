resource "netlify_site" "blog" {
  name = "shinncloud-blog"

  repo {
    repo_branch   = "master"
    command       = "hugo"
    dir           = "public"
    provider      = "github"
    repo_path     = "shinncloud/site"
  }
}
