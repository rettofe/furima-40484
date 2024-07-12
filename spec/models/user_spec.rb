require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'メールアドレスが必須であること' do
      user = FactoryBot.build(:user) 
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    
    it 'メールアドレスが一意性であること' do
      user1 = FactoryBot.create(:user) 
      user2 = FactoryBot.build(:user, email: user1.email) 
      user2.valid?
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end
    
    it 'メールアドレスは、@を含む必要があること' do
      user = FactoryBot.build(:user) 
      user.email = 'testexample.com' 
      user.valid?
      expect(user.errors.full_messages).to include "Email is invalid"
    end
    
    it 'パスワードが必須であること' do
      user = FactoryBot.build(:user) 
      user.password = '' 
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    
    it 'パスワードは、6文字以上での入力が必須であること' do
      user = FactoryBot.build(:user) 
      user.password = '12345' 
      user.valid?
      expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      user = FactoryBot.build(:user) 
      user.password = '123456' 
      user.password_confirmation = '1234567' 
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end