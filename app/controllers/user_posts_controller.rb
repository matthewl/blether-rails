class UserPostsController < ApplicationController
  def index
    account = Account.find_by!(username: params[:username])
    @posts = account.posts
    json_response(@posts)
  end
end