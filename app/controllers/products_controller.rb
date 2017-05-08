class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:collect, :remove,:add_to_cart,:upvote, :downvote]
  before_action :validate_search_key, only:[:search]

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def upvote
    @product = Product.find(params[:id])
    if !current_user.is_voter_of?(@product)
      current_user.like!(@product)
      flash[:notice]= "您已点赞了该商品"
    else
      flash[:warning]= "您已点赞过该商品，无法重复点赞"
    end
    redirect_to :back
  end

  def downvote
    @product = Product.find(params[:id])
    if !current_user.is_anti_of?(@product)
      current_user.dislike!(@product)
      flash[:notice]= "您已踩了该商品"
    else
      flash[:warning]= "您已踩过该商品，无法重复踩它"
    end
    redirect_to :back

  end


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

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end
