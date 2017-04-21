class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all
    @user = current_user
    @cart = current_user.current_cart if current_user
  end
end
