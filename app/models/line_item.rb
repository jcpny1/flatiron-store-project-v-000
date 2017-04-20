class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  after_initialize do |line_item|
    line_item.quantity ||= 0
  end
end
