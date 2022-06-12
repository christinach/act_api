class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.string :unit
      t.integer :cost
      t.integer :tax
      t.string :vendor, null: false
      t.integer :total_cost
      t.timestamp :date_of_order
      t.timestamp :date_of_arrival
      t.timestamps
    end
  end
end
