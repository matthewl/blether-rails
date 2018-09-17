require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # Our test account and posts
  let!(:account) { create(:account) }
  let!(:posts) { create_list(:post, 7, account_id: account.id) }
  let(:post_id) { posts.first.id }

  # Valid headers for authorization
  let(:headers) { valid_headers }

  describe 'GET /posts' do
    before { get '/posts', params: {}, headers: headers }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(7)
    end

    it 'returns a status code of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id' do
    before { get "/posts/#{post_id}", params: {}, headers: headers }

    context 'when the post exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns a status code of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 100 }

      it 'returns the status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/) 
      end
    end
  end
end