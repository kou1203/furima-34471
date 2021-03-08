class ProductHistory < ApplicationRecord

  belongs_to :user
  belongs_to :product
  has_one :purchase 

end
