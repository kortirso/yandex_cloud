module YandexCloud
  class Translate
    # Module for translation for text or phrase
    module Translate
      # Translate
      def translate(args = {})
        # define params for request
        body = { 'folderId' => folder_id, 'text' => args[:text], 'source' => args[:source], 'target' => args[:target], 'format' => args[:format] }
        headers = { 'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => "Bearer #{iam_token}" }
        # make request
        self.class.post('/translate', query: body, headers: headers).parsed_response
      end
    end
  end
end
