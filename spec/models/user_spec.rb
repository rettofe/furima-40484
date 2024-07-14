require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
  context 'ユーザー登録ができるとき' do
  it 'すべての項目が存在すれば登録できること' do
    expect(@user).to be_valid
  end
  it 'emailに@が含まれている場合、バリデーションが通る' do
    @user.email = 'user@example.com'
    expect(@user).to be_valid
  end

  it 'passwordが6文字以上である場合、バリデーションが通る' do
    @user.password = 'password123'
    @user.password_confirmation = 'password123'
    expect(@user).to be_valid
  end
  end
  context 'ユーザー登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'emailに＠がなければ登録できない' do
      @user.email = 'email.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが6文字未満では登録できない' do
      @user.password = '1a' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが半角英数字混合でなければ登録できない（英字のみ）' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが半角英数字混合でなければ登録できない（数字のみ）' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'お名前(全角)が名字と名前でなければ登録できない' do
      @user.first_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "Last name can't be blank"
    end
    
    it 'お名前(全角)が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'yamada'
      @user.last_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid", "Last name is invalid"
    end
    
    it 'お名前カナ(全角)が名字と名前でなければ登録できない' do
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank", "Last name kana can't be blank"
    end
    
    it 'お名前カナ(全角)が全角（カタカナ）でなければ登録できない' do
      @user.first_name_kana = 'やまだ'
      @user.last_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid", "Last name kana is invalid"
    end
    
    it 'passwordに全角を含むと登録できない' do
      @user.password = 'パスワード123'
      @user.password_confirmation = 'パスワード123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
  end
  end