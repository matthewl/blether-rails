class Post < ApplicationRecord
  belongs_to :account
  belongs_to :post, foreign_key: :reply_to_post_id, optional: true

  has_many :replies, foreign_key: :reply_to_post_id, class_name: 'Post'

  validates_presence_of :body
end
