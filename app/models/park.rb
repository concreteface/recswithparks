class Park < ActiveRecord::Base
  validates :name, :street, presence: true
  validates :description, length: { minimum: 20 }, allow_nil: true

  has_many :reviews

  paginates_per 10
  max_paginates_per 10

  def rating
    if reviews.empty?
      0
    else
      reviews.pluck(:rating).reduce(:+) / reviews.size
    end
  end
end
