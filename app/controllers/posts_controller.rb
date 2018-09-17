class PostsController < ApplicationController
  def index
    @posts = current_account.posts
    json_response(@posts)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end

  def create
    @post = current_account.posts.create!(post_params)
    json_response(@post, :created)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :body, :account_id)
  end
end
