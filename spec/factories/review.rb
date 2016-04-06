FactoryGirl.define do
  factory :review do
    rating 4
    sequence(:body) { |n| "This park is really cool #{n} pieces of bread are there" }
    association :user, factory: :user
    association :park, factory: :park
  end
end
