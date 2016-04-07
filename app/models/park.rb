class Park < ActiveRecord::Base
  validates :name, :street, presence: true
  validates :description, length: {minimum: 20}, allow_nil: true

  has_many :reviews

  def rating
    unless reviews.empty?
      reviews.pluck(:rating).reduce(:+) / reviews.size
    else
      0
    end
  end
end
