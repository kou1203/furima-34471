require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end 
  describe '新規登録/ユーザー情報' do 
    it 'ニックネームが必須であること' do 
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end 

    it 'メールアドレスが必須であること' do 
      @user.email = '' 
      @user.valid? 
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end 

    it 'メールアドレスが一意性であること' do
      user_another = FactoryBot.build(:user)
      user_another.save
      @user = FactoryBot.build(:user)
      @user.email = user_another.email
    @user.valid? 
      expect(@user.errors.full_messages).to include('Email has already been taken')
      
    end 

    it 'メールアドレスは、@を含む必要があること' do 
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end 

    it 'パスワードが必須であること' do 
      @user.password = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end 

    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do 
      @user.password = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end 

    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do 
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is invalid")
    end 

    it 'パスワード(確認用)は、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do 
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is invalid")
    end 

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do 
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 


  end 

end