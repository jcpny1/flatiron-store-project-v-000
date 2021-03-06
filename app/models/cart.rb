class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item_id)
    line_item = self.line_items.find_or_initialize_by(item_id: item_id)
    line_item.quantity += 1
#    line_item.save
    line_item
  end

  def checkout
    self.line_items.each { |li|
      item = Item.find(li.item_id)
      item.update(inventory: (item.inventory - li.quantity))
    }
    self.line_items.destroy_all
    self.user.current_cart = nil
    self.user.save
  end

  def total
    total_amount = 0.0
    self.line_items.each { |li|
      total_amount += li.quantity * li.item.price
    }
    total_amount
  end

end
