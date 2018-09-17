class PostsController < ApplicationController
  def index
    following_ids = current_account.following.collect(&:account_id)
    @posts = Post.where(account_id: following_ids).order('created_at DESC')
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :body, :account_id)
  end
end
