class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :locations, foreign_key: true, index: true
      t.boolean :franchise, default: false
      t.string :address, index: true
      t.string :phone_number
      t.string :email, unique: true, index: true
      t.timestamps
    end
  end
end
