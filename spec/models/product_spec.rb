require 'rails_helper'

RSpec.describe Product, type: :model do
  before do 
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できる時' do 
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存できる' do 
        expect(@product).to be_valid 
      end 

      it '販売価格が¥300~¥9,999,999の間であれば保存できる' do
        @product.price = 3000
        expect(@product).to be_valid 
      end
    end 

    context '商品出品できない時' do 
      it '商品画像がないと出品できない' do 
        @product.image = nil
        @product.valid? 
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end 

      it '商品名がないと出品できない' do 
        @product.name =""
        @product.valid? 
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end 

      it '商品の説明がないと出品できない' do 
        @product.description = ""
        @product.valid? 
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end 

      it 'カテゴリー情報がないと出品できない' do 
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end 

      it '商品の状態の情報がないと出品できない' do 
        @product.status_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end 

      it '配送料負担の情報がないと出品できない' do 
        @product.shipping_burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping burden must be other than 1")
      end

      it '発送元の地域についての情報がないと出品できない' do 
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end 

      it '発送までの日数についての情報がないと出品できない' do 
        @product.days_to_ship_id = 1
        @product.valid? 
        expect(@product.errors.full_messages).to include("Days to ship must be other than 1")
      end 

      it '販売価格についての情報がないと出品できない' do 
        @product.price = ""
        @product.valid? 
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is invalid")
      end

      it '販売価格は、¥300より低いと出品できない' do 
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it '販売価格は、¥10,000,000以上では出品できない' do 
        @product.price = 12345678
        @product.valid? 
        expect(@product.errors.full_messages).to include()
      end 

      it '販売価格は半角数字出ないと保存できない' do 
        @product.price = "２００００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end 

      it '販売価格は半角英数混合では出品できない' do 
        @product.price = "2000yen"
        @product.valid? 
        expect(@product.errors.full_messages).to include()
      end 

      it '販売価格は半角英語だけでは出品できない' do 
        @product.price = "aaaayen"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
    end 

  end
end