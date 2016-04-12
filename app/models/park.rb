class Park < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, :street, presence: true
  validates :description, length: { minimum: 20 }, allow_nil: true

  paginates_per 10
  max_paginates_per 10

  def rating
    rating = 0.0
    unless reviews.empty?
      rating = (reviews.pluck(:rating).reduce(:+).to_f / reviews.size).round(1)
    end
    rating
  end

  def self.search(query)
    where( 'name ILIKE ? OR description ILIKE ?', "%#{query}%", "%#{query}%" )
  end
end
