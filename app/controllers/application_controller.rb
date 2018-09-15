class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_account

  private

  def authorize_request
    @current_account = AuthorizeApiRequest.new(request.headers).call[:account]
  end
end
