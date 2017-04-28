class ProductsController < ApplicationController
 before_action :authenticate_user!, only:[:collect, :remove]

  def collect
    @product = Product.find(params[:id])
    if !current_user.is_collector_of?(@product)
      current_user.collect!(@product)
      flash[:notice]= "已收藏该商品"

    else
      flash[:warning]="您已收藏过该商品"
    end
    redirect_to product_path(@product)
  end

  def remove
    @product = Product.find(params[:id])
    if current_user.is_collector_of?(@product)
     current_user.remove!(@product)
     flash[:alert]= "已取消收藏该商品"
   else
     flash[:warning]= "您未收藏该商品,无法取消收藏"
   end
   redirect_to product_path(@product)

  end

  




  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "你的购物车内已有此商品"
    end
    redirect_to :back
  end
end
