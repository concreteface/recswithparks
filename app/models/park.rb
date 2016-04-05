class Park < ActiveRecord::Base
  has_many :reviews

  def rating
    reviews.pluck(:rating).reduce(:+) / reviews.size
  end
end
