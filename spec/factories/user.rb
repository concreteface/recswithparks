FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password "password"
    association :species, factory: :species
  end
end
