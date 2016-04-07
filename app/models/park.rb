class Park < ActiveRecord::Base
  validates :name, :street, presence: true
  validates :description, length: { minimum: 20 }, allow_nil: true

  has_many :reviews

  def rating
    rating = 0.0
    unless reviews.empty?
      rating = (reviews.pluck(:rating).reduce(:+).to_f / reviews.size).round(1)
    end
    rating
  end
end
