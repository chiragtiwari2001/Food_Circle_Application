class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :category, null: false, foreign_key: true
      t.string :food_name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
