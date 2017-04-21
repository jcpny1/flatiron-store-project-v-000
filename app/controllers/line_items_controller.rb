class LineItemsController < ApplicationController
  def create
    if current_user.current_cart.nil?
      new_cart = Cart.new(status: 'not submitted')
      current_user.carts << new_cart
      current_user.current_cart = new_cart
      current_user.save
    end
    line_item = current_user.current_cart.add_item(params[:item_id])
    line_item.save
    redirect_to current_user.current_cart
  end
end
