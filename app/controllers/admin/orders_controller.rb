class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @orders = Order.all.order("id DESC")
  end
end
