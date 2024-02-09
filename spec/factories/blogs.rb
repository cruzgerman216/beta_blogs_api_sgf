FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph_by_chars }
    user
  end
end
