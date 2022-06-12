class CreatePurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_orders do |t|
      t.string :status, null: false
      t.references :purchase_order_categories, foreign_key: true, index: true
      t.timestamps
    end
  end
end
