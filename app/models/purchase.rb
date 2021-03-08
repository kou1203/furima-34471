class Purchase < ApplicationRecord
  attr_accessor :token

  belongs_to :product_history
end
