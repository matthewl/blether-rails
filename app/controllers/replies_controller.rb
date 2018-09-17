class RepliesController < ApplicationController
  def create
    @post = current_account.posts.create!(post_params)
    json_response(@post, :created)
  end

  private

  def post_params
    params.permit(:body, :reply_to_post_id)
  end
end
