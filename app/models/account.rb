class Account < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  validates_presence_of :username, :email, :password_digest
end
