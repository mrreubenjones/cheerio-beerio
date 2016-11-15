class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :star_count
      t.text :body
      t.references :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end
