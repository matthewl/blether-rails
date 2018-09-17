FactoryBot.define do
  factory :post do
    title { Faker::Lorem.words(3) }
    body { Faker::Lorem.paragraph(1) }
    account
  end
end