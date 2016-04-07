FactoryGirl.define do
  factory :vote do
    upvote true
    association :user, factory: :user
    association :review, factory: :review
  end
end
