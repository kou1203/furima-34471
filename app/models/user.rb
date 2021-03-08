class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VARID_PASSWORD_REGEX = /(?=.*?[a-z])(?=.*?\d)/i
  VARID_NAME_REGEX = /[ぁ-んァ-ヶ一-龥々]/
  VARID_NAME_KANA_REGEX = /[ァ-ヶ]/

  has_many :products 
  has_many :product_histories

  with_options presence: true do 
  validates :password, format:{ with: VARID_PASSWORD_REGEX }
  validates :nickname 
  validates :last_name, format:{ with: VARID_NAME_REGEX } 
  validates :first_name, format:{ with: VARID_NAME_REGEX } 
  validates :last_name_kana, format:{ with: VARID_NAME_KANA_REGEX }
  validates :first_name_kana, format:{ with: VARID_NAME_KANA_REGEX } 
  validates :birthday
  end 
end