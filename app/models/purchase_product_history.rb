class PurchaseProductHistory
  include ActiveModel::Model 
  attr_accessor :postal_code, :prefecture_id,:municipalities, :address, :building_name, :telephone_number,:product_history_id, :product_id, :user_id, :token

  VARID_POSTAL_CODE_REGEX = /[0-9]{3}-[0-9]{4}/
  VARID_TELEPHONE_NUMBER_REGEX = /[0-9]{11}/

  with_options presence: true do 
    validates :postal_code, format: { with: VARID_POSTAL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address 
    validates :telephone_number, format: { with: VARID_TELEPHONE_NUMBER_REGEX }
    validates :token
  
  end 
  

  def save 
    product_history = ProductHistory.create(product_id: product_id, user_id: user_id)

    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id,municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number,product_history_id: product_history.id)
  end 
end 