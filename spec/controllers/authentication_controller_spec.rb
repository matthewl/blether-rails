require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
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
      }
    end

    # Invalid authentication credentials
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }
    end

    context 'when request is valid' do
      before do
        @request.headers.merge(headers)
        post :authenticate, params: valid_credentials
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before do
        @request.headers.merge(headers)
        post :authenticate, params: invalid_credentials
      end

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
