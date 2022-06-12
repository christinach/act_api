class CreateProductsPurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :products_purchase_orders, id: false do |t|
      t.belongs_to :products
      t.belongs_to :purchase_orders
      t.timestamps
    end
  end
end
