resource "github_repository" "packer" {
  name          = "packer"
  has_downloads = true
  has_issues    = true
  has_wiki      = false
  has_projects  = false
}

resource "github_repository" "terraform" {
  name          = "terraform"
  has_downloads = true
  has_issues    = true
  has_wiki      = false
  has_projects  = false
}

resource "github_repository_deploy_key" "buildkite_packer" {
  title      = "Buildkite Packer SSH key"
  repository = github_repository.packer.name
  key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2gqIDYHnLwvD1jkXl1wEdR3L17KclceKjeOx/bo0pg01WXeY7C0WABF/It8m+ImK7iyViBbWz5WkW9q/FhZudezonHhgMMHlGwNPsDwtXA7ZRL/ZNPvZSaHyecvo15SIF2OdWkzHJ1QR6BpHAcxHNwWgKy1vWJ59CXlWA08uuUgENcNXKPgByVOyCgLheJyoPgCOcl7kfZhN4rrTCzdxp11SaEhUyLjaHUSWEWOeOODk6TXSZtruk0ZRW4XfeAsG66+Nu7731/x1O6cO1cwPmUfnOJreuhqAn311upP6kyCmVEoYOTSTwHZVZmCG2jTHx4WkLmlzivgJg4JHIGhWrO16gYko10ppV+ApXmv+jFuUq+6rBZHiR8ow3tso4drsmJbJg1frwJMSAVG9U8QQhMqE/SdUHpmr57D4yitVXXJRvbtiKf//cfMQdfOhS8l9d62tc3MEES9QVRHtiD+Nxp5HXzQU6HdAfYTBnvEoOBc1TsH6lXyC47eki0JHPZGxEsNI/d6NwJkWGU6T5/gssZzc4c3Kr5GcvUpA3/Mo4vUPs3ekYhECS62Km09Fe+HlHZXSBaK3z4e938cND8dfRBlMZvWDixLFoToelV1NpjSUx/OlMhWx1f/e9rkV7IB/oKkiGIXoi3luc4Tfm10ZfM10Tt8xBkNtNQo6tgGzvbw=="
  read_only  = true
}

resource "github_repository_deploy_key" "buildkite_packer" {
  title      = "Buildkite Terraform SSH key"
  repository = github_repository.terraform.name
  key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEI6LDtdEPJ3PD6nImqH0aokiB2BkXeL3Whj4JATU8RV00AxK4UYjl+y/dT1LKw3aWMNQozB1XStu5T2JC3iEV60HwxaVkqEqs+zawsbINezL8oPgrXv/XbBHAuGypibdYsaM0nHzw6rjMrDJRlQIR++n7gCgPE98WftDdSXQdqIesHf3JTXvn/evehAXfgKGkpiKi6pjcmjy/0vdTPL/I3lcvrwfQLe1ksv9IWVYn742XDqF7NgiYgAmo1D0UM+B8DP+m4tuqDNAIfZevyaks8dr9I6sN/x+9pjb/70//sWDnDnhMAynsIt2RtLeDVRyn2XzXij+8eop06TYwgQ1IP0xY+mJXeAHb+hQLRYHEaBJRab7D3+1d08Xj3/137tTKdReRdCdv+OwbPAWBoKPZU60FTr6nEfgISdwyjUQrFYrzNBEhgT2WeSXQpi2dw07aMOLJzlw3wsccPKUzmjRhdhzMS6NNMy/hcuyKL/m6ExYWtbd4bqwvBOyLSSyjU6fiZWxuqxMJ71ZnwSKDa8A+6MDtWonbtFq/1KNtdmWkXTqA9GjbRskJ9MLcan21Gltkw6SxNVrwkllogcurHl16MyMGTCE0UbRSyB0nWKEf8Vr/dlqdopldgIv5d3azCJiCaNSqSVA2bQj26dFECPYVGAIfbham32820QPHmAwQUQ=="
  read_only  = true
}

resource "github_organization_project" "main" {
  name = "Infrastructure Learning"
  body = "A project board for ShinnCloud infrastructure learning."
}

resource "github_project_column" "ready" {
  project_id = github_organization_project.main.id
  name       = "Ready"
}

resource "github_project_column" "in_progress" {
  project_id = github_organization_project.main.id
  name       = "In Progress"
}

resource "github_project_column" "done" {
  project_id = github_organization_project.main.id
  name       = "Done"
}
