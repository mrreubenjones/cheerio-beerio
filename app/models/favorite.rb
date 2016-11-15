class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :product_id, uniqueness: {scope: :user_id}

  delegate :title, :description, :category, :price, to: :product, prefix: true, allow_nil: true

  def star_count
    product.reviews.for_user(user.id)
  end
end
