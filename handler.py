from lambda_decorators import ssm_parameter_store
import twitter


@ssm_parameter_store([
    '/bike2workbot/consumer_key',
    '/bike2workbot/consumer_secret',
    '/bike2workbot/access_token',
    '/bike2workbot/access_token_secret',
])
def tweet(event, context):
    api = twitter.Api(consumer_key=context.parameters['/bike2workbot/consumer_key'],
                      consumer_secret=context.parameters['/bike2workbot/consumer_secret'],
                      access_token_key=context.parameters['/bike2workbot/access_token'],
                      access_token_secret=context.parameters['/bike2workbot/access_token_secret'])
    api.PostUpdate('Happy bike around and then back home day 😕')
