require 'rails_helper'

RSpec.describe 'Friends API', type: :request do
  # Our test accounts
  let(:account) { create(:account) }
  let(:following_account) { create(:account) }
  let(:unfollowed_account) { create(:account) }
  let!(:follower) { create(:follower, account_id: following_account.id, follower_id: account.id) }
  

  # Set headers for sign up
  let(:headers) { valid_headers }

  # Valid follow attributes
  let(:valid_follow_attributes) { { username: unfollowed_account.username } }

  # Invalid follow attributes
  let(:invalid_follow_attributes) { { username: 'Bob' } }

  describe 'POST /friends' do
    context 'when valid request' do
      before { post '/friends', params: valid_follow_attributes.to_json, headers: headers }

      it 'returns the status code of 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a follower' do
        expect(json['account_id']).to eq(unfollowed_account.id)
      end

      it 'creates a follower' do
        expect(json['follower_id']).to eq(account.id)
      end
    end

    context 'when invalid request' do
      before { post '/friends', params: invalid_follow_attributes.to_json, headers: headers }

      it 'returns the status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Account/) 
      end
    end
  end

  describe 'DELETE /friends' do
    before { delete "/friends/#{follower.id}", headers: headers }

    it 'returns the status code of 204' do
      expect(response).to have_http_status(204)
    end
  end
end
