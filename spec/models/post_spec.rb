require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:account) }
  it { should belong_to(:post) }
  it { should have_many(:replies) }
  it { should validate_presence_of(:body) }
end
