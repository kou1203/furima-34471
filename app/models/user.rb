class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VARID_PASSWORD_REGEX = /(?=.*?[a-z])(?=.*?\d)/i
  VARID_NAME_REGEX = /[ぁ-んァ-ヶ一-龥々]/
  VARID_NAME_KANA_REGEX = /[ァ-ヶ]/
  validates :password, format:{ with: VARID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :last_name, presence: true, format:{ with: VARID_NAME_REGEX } 
  validates :first_name, presence: true, format:{ with: VARID_NAME_REGEX } 
  validates :last_name_kana, presence: true, format:{ with: VARID_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format:{ with: VARID_NAME_KANA_REGEX } 
  validates :birthday, presence: true 

end