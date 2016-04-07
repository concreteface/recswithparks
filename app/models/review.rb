class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :votes

  def vote_total
    upvotes_count = votes.select{|vote| vote}.length
    upvotes_count - (votes.length - upvotes_count)
  end
end
