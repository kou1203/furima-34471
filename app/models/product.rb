class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  VARID_PRICE_REGEX = /[3-9][0-9]{2}|[1-9][0-9]{3,6}/

  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :days_to_ship 

  with_options presence: true do 
    validates :image
    validates :name
    validates :description
    validates :price, format:{ with: VARID_PRICE_REGEX }
  end

  with_options numericality: { other_than: 1 } do 
    validates :category_id 
    validates :status_id 
    validates :shipping_burden_id 
    validates :prefecture_id 
    validates :days_to_ship_id 
  end
end

