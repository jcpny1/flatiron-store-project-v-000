class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true
      t.integer :quantity
      t.decimal :price

      t.timestamps null: false
    end
    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :items
  end
end
