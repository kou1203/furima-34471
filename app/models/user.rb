class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VARID_PASSWORD_REGEX = /(?=.*?[a-z])(?=.*?\d)/i
  validates :password, format:{ with: VARID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :last_name, presence: true 
  validates :first_name, presence: true 
  validates :last_name_kana, presence: true 
  validates :first_name_kana, presence: true 
  validates :birthday, presence: true 

end