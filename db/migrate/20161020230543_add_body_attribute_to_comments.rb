class AddBodyAttributeToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :body, :text
  end
end
