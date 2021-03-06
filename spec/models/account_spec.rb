require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should have_many(:posts) }
  it { should have_many(:followers) }
  it { should have_many(:following) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
