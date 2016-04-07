class Park < ActiveRecord::Base
  has_many :reviews

  def rating
    rating = 0.0
    unless reviews.empty?
      rating = (reviews.pluck(:rating).reduce(:+).to_f / reviews.size).round(1)
    end
    rating
  end
end
