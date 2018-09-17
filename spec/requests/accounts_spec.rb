require 'rails_helper'

RSpec.describe 'Sign up API', type: :request do
  # Our test account
  let(:account) { build(:account) }

  # Set headers for sign up
  let(:headers) { valid_headers.except('Authorization') }

  # Valid signup attributes
  let(:valid_attributes) do
    attributes_for(:account, password_confirmation: account.password).to_json
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes, headers: headers }

      it 'creates a new account' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new account' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Username can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end
