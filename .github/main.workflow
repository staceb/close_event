workflow "New workflow" {
  on = "pull request"
  resolves = ["actions/bin/sh@master"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "action closed"
}

action "actions/bin/sh@master" {
  uses = "actions/bin/sh@master"
  needs = ["Filters for GitHub Actions"]
  args = "[echo hello]"
}
