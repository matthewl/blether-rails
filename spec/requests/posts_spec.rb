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

  describe 'POST /posts' do
    # A valid post to create
    let!(:account) { create(:account) }
    let(:valid_attributes) { { title: 'Side-project update', body: "I'm going to make the next Twitter." }.to_json }
    let(:invalid_attributes) { { body: '' }.to_json }

    context 'when the request is valid' do
      before { post '/posts', params: valid_attributes, headers: headers }

      it 'creates a post with a title' do
        expect(json['title']).to eq('Side-project update')
      end

      it 'creates a post with a body' do
        expect(json['body']).to eq("I'm going to make the next Twitter.")
      end

      it 'returns the status code of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/posts', params: invalid_attributes, headers: headers }

      it 'returns the status code of 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Body can't be blank/)
      end
    end
  end

  describe 'PUT /posts/:id' do
    let!(:account) { create(:account) }
    let(:valid_attributes) { { title: 'Side-project update', body: "I'm going to make the next Twitter and be a billionaire." }.to_json }

    context 'when the record exists' do
      before { put "/posts/#{post_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns the status code of 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

end