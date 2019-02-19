workflow "Deploy master branch" {
  on = "push"
  resolves = ["Deploy with Serverless"]
}

action "Only on master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Install dependencies" {
  uses = "actions/npm@master"
  args = "install"
  needs = ["Only on master branch"]
}

action "Deploy with Serverless" {
  uses = "serverless/github-action@master"
  args = "deploy"
  needs = ["Install dependencies"]
  secrets = ["SERVERLESS_ACCESS_KEY"]
}
