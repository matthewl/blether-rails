class Post < ApplicationRecord
  belongs_to :account

  validates_presence_of :body
end
