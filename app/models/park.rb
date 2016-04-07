class Park < ActiveRecord::Base
  validates :name, :street, presence: true
  validates :description, length: { minimum: 20 }, allow_nil: true

  has_many :reviews

  def rating
    if reviews.empty?
      0
    else
      reviews.pluck(:rating).reduce(:+) / reviews.size
    end
  end
end
