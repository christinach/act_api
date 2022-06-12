class PurchaseOrderCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_order_categories do |t|
      t.string :category, null: false
    end
  end
end
