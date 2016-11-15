class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  scope :for_user, -> (user_id) { where(user_id: user_id).first }

  # validates :star_count, presence: true,
  #                        numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }


end
