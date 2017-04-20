class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :item, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :line_items, :carts
    add_foreign_key :line_items, :items
  end
end
