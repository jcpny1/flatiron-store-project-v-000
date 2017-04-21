class LineItemsController < ApplicationController
  def create
    if current_user.current_cart.nil?
      new_cart = Cart.new(status: 'not submitted')
      current_user.carts << new_cart
      current_user.current_cart = new_cart
      current_user.save
    end
    current_user.current_cart.add_item(params[:item_id])
    redirect_to current_user.current_cart
  end
end
