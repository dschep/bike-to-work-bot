workflow "Deploy master branch" {
  on = "push"
  resolves = ["serverless deploy"]
}

action "master branch only" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "npm install" {
  uses = "actions/npm@master"
  args = "install"
  needs = ["master branch only"]
}

action "serverless deploy" {
  uses = "dschep/serverless-github-action@master"
  args = "deploy"
  needs = ["npm install"]
  secrets = ["SERVERLESS_ACCESS_KEY"]
}
