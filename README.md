# YandexCloud

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yandex_cloud'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_cloud

## Get access to API

To make api requests in Yandex.Cloud you must include IAM-token in request headers and for getting IAM-token you must have Oauth token.

Instructions for getting Oauth token is [here](https://cloud.yandex.com/docs/iam/operations/iam-token/create)

### Configuration

You can use your Oauth token directly in spesific requests or put it to the ENV variables.

## Using

## Get IAM-token for cloud API access

Request for getting IAM-token for access to cloud API. Valid 12 hours.

```ruby
# with oauth_token in ENV
auth_service = YandexCloud::Auth.new
auth_service.token

# or with oauth_token in service declaration
auth_service = YandexCloud::Auth.new(oauth_token: oauth_token)
auth_service.token
```

#### Responses

```ruby
# successful response
{ 'iamToken' => iam_token }

# response with errors
{ 'code' => 16, 'message' => 'Token is invalid or has expired.', 'details' => [...] } 
```

## Translate service

### Configuration

For using Translate service you need additionally get FOLDER_ID.

Instruction for getting FOLDER_ID is [here](https://cloud.yandex.com/docs/translate/concepts/auth)

You can use your FOLDER_ID directly in spesific requests or put it to the ENV variables.

```ruby
# with FOLDER_ID in ENV
translator = YandexCloud::Translate.new(iam_token: iam_token)

# or with FOLDER_ID in service declaration
translator = YandexCloud::Translate.new(iam_token: iam_token, folder_id: '12345')
```

#### Options

    iam_token - IAM-token, required
    folder_id - folder ID of your account at YandexCloud, optional

### Supported languages

Request for getting list of supported languages is #languages.

```ruby
translator.languages()
```

#### Responses

```ruby
# successful response
{ 'languages' => [...] }

# response with errors
{ 'error_message' => '' }
```

### Detection

Request for detecting language of text is #detect.

```ruby
translator.detect(text: 'Hello')
```

#### Options

    text - text for detection, required
    hint - list of possible languages, optional, example - 'en,ru'

#### Responses

```ruby
# successful response
{ 'language' => 'es' }

# response with errors
{ 'error_message' => '' }
```

### Translation

Request for translating text is #translate.

```ruby
translator.translate(text: 'Hola', target: 'en')
```

#### Options

    text - text for detection, required
    source - source language, ISO 639-1 format (like 'en'), optional
    target - target language, ISO 639-1 format (like 'ru'), required
    format - text format, one of the [plain|html], default - plain, optional

#### Responses

```ruby
# successful response
{ 'translations' => [{ 'text' => 'Hello' }]}

# response with errors
{ 'error_message' => '' }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kortirso/yandex_cloud.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Disclaimer

Use this package at your own peril and risk.

## Code of Conduct

Everyone interacting in the YandexCloud project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kortirso/yandex_cloud/blob/master/CODE_OF_CONDUCT.md).
