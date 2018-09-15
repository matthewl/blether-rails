module ControllerSpecHelper
  # Generate tokens from the account id
  def token_generator(account_id)
    JsonWebToken.encode(account_id: account_id)
  end

  # Generate expired tokens from the account id
  def expired_token_generator(account_id)
    JsonWebToken.encode({ account_id: account_id }, (Time.now.to_i - 10))
  end

  # Return valid headers
  def valid_headers
    {
      'Authorization' => token_generator(account.id),
      'Content-Type' => 'application/json'
    }
  end

  # Return invalid headers
  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end
end