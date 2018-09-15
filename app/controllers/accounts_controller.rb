class AccountsController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    account = Account.create!(account_params)
    auth_token = AuthenticateAccount.new(account.email, account.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def account_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
