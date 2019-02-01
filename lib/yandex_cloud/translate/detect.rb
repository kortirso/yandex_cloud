module YandexCloud
  class Translate
    # Module for detecting language of the text
    module Detect
      # Detect
      def detect(args = {})
        # define params for request
        body = { 'folderId' => folder_id, 'hint' => args[:hint], 'text' => args[:text] }
        headers = { 'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => "Bearer #{iam_token}" }
        # make request
        self.class.post('/detect', query: body, headers: headers).parsed_response
      end
    end
  end
end
