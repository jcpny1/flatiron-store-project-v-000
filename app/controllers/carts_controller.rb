class CartsController < ApplicationController
  def show
  end

  def checkout
    if current_cart.nil?
      current_user.current_cart = Cart.find(params[:id])
      binding.pry
    end
    current_cart.line_items.each { |li|
      item = Item.find(li.item_id)
      item.update(inventory: (item.inventory - li.quantity))
    }
    current_cart.line_items.destroy_all
#    current_user.current_cart = nil
    redirect_to cart_path
  end
end
