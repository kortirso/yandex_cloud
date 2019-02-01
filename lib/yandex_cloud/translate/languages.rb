module YandexCloud
  class Translate
    # Module for getting list of languages from Translation service
    module Languages
      # Get list
      def languages
        # define params for request
        body = { 'folderId' => folder_id }
        headers = { 'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => "Bearer #{iam_token}" }
        # make request
        self.class.post('/languages', query: body, headers: headers).parsed_response
      end
    end
  end
end
