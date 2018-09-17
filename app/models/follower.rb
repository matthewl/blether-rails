class Follower < ApplicationRecord
  belongs_to :account
  belongs_to :follower, foreign_key: :follower_id, class_name: 'Account'
end