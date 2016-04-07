class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :votes


  def vote_total
    upvotes_count = votes.count{ |vote| vote }
    upvotes_count - (votes.length - upvotes_count)
  end
end
