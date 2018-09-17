require 'rails_helper'

RSpec.describe 'User Posts API', type: :request do
  # Our test account and posts
  let!(:account) { create(:account) }
  let!(:posts) { create_list(:post, 7, account_id: account.id) }

  # Valid headers for authorization
  let(:headers) { valid_headers }

  describe 'GET /user/posts/:username' do
    before { get "/user/posts/#{account.username}", params: {}, headers: headers }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(7)
    end

    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end
  end
end