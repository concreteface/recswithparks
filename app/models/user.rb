class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews

  def vote(vote, review)
    previous_vote = Vote.find_by(user: self, review: review)
    upvote = previous_vote.upvote unless previous_vote.nil?
    if (vote == upvote)
      false
    else
      if (upvote == true || upvote == false)
        previous_vote.update(upvote: vote)
      else
        Vote.create(user: self, review: review, upvote: vote)
      end
      true
    end
  end
end
