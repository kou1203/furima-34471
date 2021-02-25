require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end 
  describe '新規登録' do 
    context '新規登録ができる時' do
      it 'ニックネーム,メールアドレス,パスワード、パスワード（確認用）、苗字、名前、苗字（振り仮名）、名前（振り仮名）、生年月日があれば登録できる。' do 
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上で半角英数字混合であれば登録できる。' do 
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end 
    end 

    context '新規登録できない時' do
      it 'ニックネームがないと登録できない' do 
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end 

      it 'メールアドレスが空だと登録できない' do 
        @user.email = '' 
        @user.valid? 
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end 

      it '同じメールアドレスがあると登録できない' do
        user_another = FactoryBot.build(:user)
        user_another.save
        @user = FactoryBot.build(:user)
        @user.email = user_another.email
        @user.valid? 
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含まないと登録できない' do 
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end 
      it 'パスワードがないと登録できない' do 
        @user.password = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end 

      it 'パスワードは、6文字以上での入力がないと登録できない' do 
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  
      end 

      it 'パスワードは、半角英数字混合での入力がないと登録できない' do 
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password is invalid")
      end 

      it 'パスワード(確認用)は、半角英数字混合での入力がないと登録できない' do 
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password is invalid")
      end 

      it 'パスワードとパスワード（確認用）は、値の一致しないと登録できない' do 
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 

      it '苗字が空だと登録できないこと' do 
        @user.last_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '氏名が空だと登録できないこと' do 
        @user.first_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end 

      it '苗字が漢字・平仮名・カタカナ以外では登録できないこと' do 
        @user.last_name = 'test'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it '氏名が漢字・平仮名・カタカナ以外では登録できないこと' do 
        @user.first_name = 'test'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name is invalid")
      end 

      it '苗字カナが空だと登録できないこと' do 
        @user.last_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '氏名カナが空だと登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '苗字カナが全角カタカナ以外では登録できないこと' do 
        @user.last_name_kana = 'test'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it '氏名カナが全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it '生年月日が必須がないと登録できない' do 
        @user.birthday = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end 

  end 

end








