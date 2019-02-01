RSpec.describe YandexCloud::Translate do
  let!(:auth_service) { YandexCloud::Auth.new }
  let!(:iam_token) { auth_service.token['iamToken'] }
  let!(:translate_service) { YandexCloud::Translate.new(iam_token: iam_token) }

  describe '.initialize' do
    it 'assigns iam_token to @iam_token' do
      expect(translate_service.iam_token).to eq iam_token
    end

    it "assigns ENV['TRANSLATE_FOLDER_ID'] to @folder_id" do
      expect(translate_service.folder_id).to eq ENV['TRANSLATE_FOLDER_ID']
    end
  end

  describe 'methods' do
    let!(:bad_translate_service) { YandexCloud::Translate.new(iam_token: iam_token, folder_id: '12345') }

    context '.languages' do
      context 'for invalid request' do
        it 'returns response with error' do
          response = bad_translate_service.languages

          expect(response['error_message']).to_not eq nil
        end
      end

      context 'for valid request' do
        it 'returns list of available languages for translations' do
          response = translate_service.languages

          expect(response['languages'].is_a?(Array)).to eq true
        end
      end
    end

    context '.detect' do
      context 'for invalid request' do
        it 'returns response with error' do
          response = bad_translate_service.detect(text: 'Hola')

          expect(response['error_message']).to_not eq nil
        end
      end

      context 'for valid request' do
        it 'returns name of language, without hint' do
          response = translate_service.detect(text: 'Hola')

          expect(response['language']).to eq 'es'
        end

        it 'returns name of language, with hint' do
          response = translate_service.detect(text: 'Hola', hint: 'es')

          expect(response['language']).to eq 'es'
        end
      end
    end
  end
end
