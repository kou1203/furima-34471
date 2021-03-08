class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :in_to_index, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  def index 
    @purchase_product_history = PurchaseProductHistory.new
  end 

  def create 
    @purchase_product_history = PurchaseProductHistory.new(purchase_product_history_params)
    if @purchase_product_history.valid?
      Payjp.api_key = "sk_test_52ff3cca1abad08fcfe13474"
      Payjp::Charge.create(
        amount: @product.price,
        card: purchase_product_history_params[:token],
        currency: 'jpy'
      )
      @purchase_product_history.save 
      return redirect_to root_path 
    else 
       render 'index'
    end 
  end

  private 

  def purchase_product_history_params 
    params.require(:purchase_product_history).permit(:postal_code, :prefecture_id,:municipalities, :address, :building_name, :telephone_number).merge(token: params[:token],product_id: @product.id,user_id: current_user.id)
  end 

  def set_product
    @product = Product.find(params[:item_id])
  end

  def in_to_index
    if current_user.id == Product.find(params[:item_id]).user_id || Product.find(params[:item_id]).product_history != nil
      redirect_to root_path
    end
  end

end




