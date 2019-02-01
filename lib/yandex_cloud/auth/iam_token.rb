module YandexCloud
  class Auth
    # Module for getting IAM token
    module IamToken
      # Get IAM token
      def token
        # define params for request
        body = { 'yandexPassportOauthToken' => oauth_token }
        headers = { 'Content-Type' => 'application/json' }
        # make request
        self.class.post('/tokens', query: body, headers: headers).parsed_response
      end
    end
  end
end
