require 'rails_helper'

RSpec.describe 'Replies API', type: :request do
  # Our test accounts and post to reply to
  let(:account) { create(:account) }
  let(:post_author) { create(:account) }
  let(:original_post) { create(:post, account_id: post_author.id) }

  # Set headers for sign up
  let(:headers) { valid_headers }

  describe 'POST /replies' do
    let(:valid_attributes) { { body: 'You should add RSS feeds.', reply_to_post_id: original_post.id }.to_json }
    let(:invalid_attributes) { { body: '', reply_to_post_id: original_post.id }.to_json }

    context 'when valid request' do
      before { post '/replies', params: valid_attributes, headers: headers }

      it 'returns the status code of 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a reply post for the current account' do
        expect(json['account_id']).to eq(account.id)
      end

      it 'creates a post with the reply' do
        expect(json['body']).to eq('You should add RSS feeds.')
      end

      it 'creates a post that is linked to a post' do
        expect(json['reply_to_post_id']).to eq(original_post.id)
      end
    end

    context 'when invalid request' do
      before { post '/replies', params: invalid_attributes, headers: headers }

      it 'returns the status code of 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Body can't be blank/) 
      end
    end
  end
end
