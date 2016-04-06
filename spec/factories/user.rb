FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password "password"
    avatar_url "http://placegoat.com/200/200"
  end
end
