class CartsController < ApplicationController
  def clean
    current_cart.clean!
    redirect_to carts_path,alert:"购物车已经清空"
  end
end
