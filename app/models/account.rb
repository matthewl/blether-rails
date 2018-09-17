class Account < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :followers, dependent: :destroy
  has_many :followees, foreign_key: :follower_id, class_name: 'Follower'

  validates_presence_of :username, :email, :password_digest
end
