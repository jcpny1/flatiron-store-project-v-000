class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :category, index: true
      t.string :title
      t.integer :inventory
      t.decimal :price

      t.timestamps null: false
    end
    add_foreign_key :items, :categories
  end
end
