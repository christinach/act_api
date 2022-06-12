class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.references :locations, foreign_key: true, index: true
      t.boolean :active, null: false
      t.timestamps
    end
  end
end
