class PostsController < ApplicationController
  def index
    @posts = current_account.posts
    json_response(@posts)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end
end
