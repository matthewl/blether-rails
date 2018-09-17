class FriendsController < ApplicationController
  def create
    followee = Account.find_by!(username: params[:username])
    @follower = Follower.create!(account_id: followee.id, follower_id: current_account.id)
    json_response(@follower, :created)
  end

  def destroy
    @follower = Follower.find(params[:id])
    @follower.destroy
    head :no_content
  end
end
