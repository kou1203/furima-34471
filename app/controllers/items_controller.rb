class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :in_to_index, only: [:edit, :update,:destroy]

  def index 
    @products = Product.order("created_at DESC")
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

  def show 
  end

  def edit 
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else  
      render :edit 
    end 
  end

  def destroy
    @product.destroy 
    redirect_to root_path 
  end 

  private

  def product_params 
    params.require(:product).permit(:image, :name, :description, :category_id,
    :status_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price ).merge(user_id: current_user.id )
  end 

  

  def in_to_index
    if current_user.id != @product.user_id || @product.product_history != nil
      redirect_to root_path 
    end
  end 

  def set_product 
    @product = Product.find(params[:id])
  end 

  
end
