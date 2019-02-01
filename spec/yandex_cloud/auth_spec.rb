RSpec.describe YandexCloud::Auth do
  let!(:auth_service) { YandexCloud::Auth.new }
  let!(:bad_auth_service) { YandexCloud::Auth.new(oauth_token: '12345') }

  describe '.initialize' do
    context 'with oauth token in params' do
      it 'assigns oauth_token to @oauth_token' do
        expect(bad_auth_service.oauth_token).to eq '12345'
      end
    end

    context 'without oauth token in params' do
      it "assigns ENV['YANDEX_CLOUD_API_KEY'] to @oauth_token" do
        expect(auth_service.oauth_token).to eq ENV['YANDEX_CLOUD_API_KEY']
      end
    end
  end

  describe 'methods' do
    context '.token' do
      context 'for bad_auth_service' do
        it 'returns response with errors' do
          response = bad_auth_service.token

          expect(response['code']).to_not eq nil
          expect(response['message']).to_not eq nil
          expect(response['details']).to_not eq nil
        end
      end

      context 'for auth_service' do
        it 'returns IAM-token' do
          response = auth_service.token

          expect(response['iamToken']).to_not eq nil
        end
      end
    end
  end
end
