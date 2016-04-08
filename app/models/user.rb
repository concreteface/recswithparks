class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :parks
  has_many :reviews

  def vote(vote, review)
    previous_vote = Vote.find_by(user: self, review: review)
    upvote = previous_vote.upvote unless previous_vote.nil?
    if vote == upvote
      false
    else
      if upvote == true || upvote == false
        previous_vote.update(upvote: vote)
      else
        Vote.create(user: self, review: review, upvote: vote)
      end
      true
    end
  end

  def add_avatar(file_location)
    File.open(file_location.to_s) do |file|
      self.avatar = file
    end
    save!
  end
end
