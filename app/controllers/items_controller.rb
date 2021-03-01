class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index 
    @products = Product.all.order("created_at DESC")
  end

  def new 
    @product = Product.new
  end 

  def create 
    @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else  
        render :new 
      end 
  end 

  private

  def product_params 
    params.require(:product).permit(:image, :name, :description, :category_id,
    :status_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price ).merge(user_id: current_user.id )
  end 

end
