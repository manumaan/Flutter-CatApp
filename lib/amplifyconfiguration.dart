const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "awswebinarexample": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://mso4h4lwxbg53libszhw5xm5ey.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-wyfcqrkhwzfnhnggwcp6y2ld54"
                }
            }
        }
    }
}''';