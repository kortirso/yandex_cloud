require 'httparty'
require_relative 'auth/iam_token'

module YandexCloud
  # Authentification requests
  class Auth
    include HTTParty
    include YandexCloud::Auth::IamToken

    base_uri 'https://iam.api.cloud.yandex.net/iam/v1'
    format :json

    attr_reader :oauth_token

    def initialize(args = {})
      @oauth_token = args[:oauth_token] || ENV['YANDEX_CLOUD_API_KEY']
    end
  end
end
