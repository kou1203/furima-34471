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
      it '電話番号が12桁以上だと登録できないこと' do 
        @purchase_product_history.telephone_number= "0901234567890"
        @purchase_product_history.valid? 
        expect(@purchase_product_history.errors.full_messages).to include("Telephone number is invalid")
      end 
      it '電話番号が全角数字だと登録できないこと' do 
        @purchase_product_history.telephone_number="０９０１２３４５６７８"
        @purchase_product_history.valid? 
        expect(@purchase_product_history.errors.full_messages).to include("Telephone number is invalid")
      end 
      it '電話番号が半角数字のみでないと登録できないこと' do 
        @purchase_product_history.telephone_number="0９012３45678"
        @purchase_product_history.valid? 
        expect(@purchase_product_history.errors.full_messages).to include("Telephone number is invalid")
      end 
      it 'user_idが空では購入できないこと' do 
        @purchase_product_history.user_id = ""
        @purchase_product_history.valid? 
        expect(@purchase_product_history.errors.full_messages).to include("User can't be blank")
      end 
      it 'item_idが空では購入できないこと' do 
        @purchase_product_history.product_id = ""
        @purchase_product_history.valid? 
        expect(@purchase_product_history.errors.full_messages).to include("Product can't be blank")
      end 
    end 
  end 
end