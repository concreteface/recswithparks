FactoryGirl.define do
  factory :park do
    sequence(:name) { |n| "Boston Public Garden #{n}" }
    street "Beacon"
    description "Garden made famous in the book Make Way for Ducklings"
    association :user, factory: :user
  end
end
