require 'rails_helper'

RSpec.describe PurchaseProductHistory, type: :model do
  before do 
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase_product_history = FactoryBot.build(:purchase_product_history,user_id: user.id, product_id: product.id) 
    sleep 0.5
  end
  describe '商品購入' do 
    context '商品購入できる時' do 
      it '正しく情報が入力されれば購入できる' do 
        expect(@purchase_product_history).to be_valid
      end 
      it '建物名がなくても保存できる' do 
        @purchase_product_history.building_name = ""
        expect(@purchase_product_history).to be_valid
      end 
    end 
    context '商品購入できない時' do 
      it '郵便番号がないと保存できない' do 
        @purchase_product_history.postal_code = ""
        @purchase_product_history.valid?
        expect(@purchase_product_history.errors.full_messages).to include("Postal code can't be blank")
      end 
      it '郵便番号にハイフンがないと保存できない' do 
        @purchase_product_history.postal_code = "1234567"
        @purchase_product_history.valid?
        expect(@purchase_product_history.errors.full_messages).to include("Postal code is invalid")
      end 
      it '都道府県情報がないと保存できない' do 
        @purchase_product_history.prefecture_id = 1
        @purchase_product_history.valid? 
        expect(@purchase_product_history.errors.full_messages).to include("Prefecture must be other than 1")
      end 
      it '市町村の情報がないと保存できない' do 
        @purchase_product_history.municipalities = ""
        @purchase_product_history.valid?
        expect(@purchase_product_history.errors.full_messages).to include("Municipalities can't be blank")
      end 
      it '番地の入力がないと保存できない' do 
        @purchase_product_history.address = ""
        @purchase_product_history.valid?
        expect(@purchase_product_history.errors.full_messages).to include("Address can't be blank")
      end 
      it '電話番号は11桁以内の数値のみでないと保存できない' do 
        @purchase_product_history.telephone_number ="abc12345678"
        @purchase_product_history.valid?
        expect(@purchase_product_history.errors.full_messages).to include("Telephone number is invalid")
      end 
    end 
  end 
end
