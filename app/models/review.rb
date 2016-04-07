class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :votes

  def vote_total
    upvotes_count = votes.pluck(:upvote).count { |vote| vote }
    downvotes_count = votes.pluck(:upvote).count { |vote| !vote }
    upvotes_count - downvotes_count
  end
end
