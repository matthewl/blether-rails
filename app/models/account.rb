class Account < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :email, :password_digest
end
