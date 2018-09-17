require 'rails_helper'

RSpec.describe 'Authentication API', type: :request do
  describe 'POST /auth/login' do
    # Our test account
    let!(:account) { create(:account) }

    # Set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }

    # Valid authentication credentials
    let(:valid_credentials) do
      {
        email: account.email,
        password: account.password
      }.to_json
    end

    # Invalid authentication credentials
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context 'when request is valid' do
      before { post '/auth/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before { post '/auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
