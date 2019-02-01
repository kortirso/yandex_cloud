require 'httparty'
require_relative 'translate/languages'

module YandexCloud
  # Authentification requests
  class Translate
    include HTTParty
    include YandexCloud::Translate::Languages

    base_uri 'https://translate.api.cloud.yandex.net/translate/v1'
    format :json

    attr_reader :iam_token, :folder_id

    def initialize(args = {})
      @iam_token = args[:iam_token]
      @folder_id = args[:folder_id] || ENV['TRANSLATE_FOLDER_ID']
    end
  end
end
