class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :in_to_index, only: :edit

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
    @product = Product.find(params[:id])
  end

  def edit 
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else  
      render :edit 
    end 
  end

  private

  def product_params 
    params.require(:product).permit(:image, :name, :description, :category_id,
    :status_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price ).merge(user_id: current_user.id )
  end 

  def in_to_index
    @product = Product.find(params[:id])
    unless user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path 
    end
  end 

end
