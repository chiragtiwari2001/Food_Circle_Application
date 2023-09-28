class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :restaurant_email
      t.text :restaurant_address
      t.text :restaurant_details
      t.integer :restaurant_contact
      t.string :status
      t.timestamps
    end
  end
end
