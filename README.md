# Bike to work bot

A twitter bot to remind you that everyday is bike to work day!!!

https://twitter.com/bikeToWorkDaily

## How to deploy
1. [Setup AWS Credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration).
2. [Create a twitter app and create credentials for it](https://apps.twitter.com/)
3. Create the following SSM Parameters in the AWS Console for the credentials you created:
 * `/bike2workbot/consumer_key`
 * `/bike2workbot/consumer_secret`
 * `/bike2workbot/access_token`
 * `/bike2workbot/access_token_secret`
4. Install pipenv, serverless, download the project, install dependencies, deploy!
```
sudo pip install pipenv
npm i -g serverless
sls install -u https://github.com/dschep/bike-to-work-bot
cd bike-to-work-bot
npm i
sls deploy
```
