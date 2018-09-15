class AuthenticateAccount
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(account_id: account.id) if account
  end

  private

  attr_reader :email, :password

  # verify account credentials
  def account
    account = Account.find_by(email: email)
    return account if account && account.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end