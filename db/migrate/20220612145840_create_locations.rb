class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :country, null: false
      t.string :city, null: false
      t.string :state
      t.string :zip_code, null: false
      t.timestamps
    end
  end
end
