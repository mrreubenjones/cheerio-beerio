class AddUserReferenceToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user, foreign_key: true, index: true
  end
end
