class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.integer :phone_number
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
