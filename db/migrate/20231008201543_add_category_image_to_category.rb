class AddCategoryImageToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :category_image, :string
  end
end
