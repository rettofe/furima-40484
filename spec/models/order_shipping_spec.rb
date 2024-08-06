require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id) # user_idを関連付ける
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されいれば保存できること' do
        expect(@order_shipping).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@order_shipping).to be_valid
        end
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @order_shipping.post_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post number can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_shipping.post_number = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県が必須であること' do
        @order_shipping.shipping_source_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Shipping source can't be blank")
      end

      it '市区町村が必須であること' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_shipping.street = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が必須であること' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は、9桁以下では登録できないこと' do
        @order_shipping.phone_number = '090123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Enter it as follows (e.g. 09012345678)")
      end
      it '電話番号は、12桁以上では登録できないこと' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Enter it as follows (e.g. 09012345678)")
      end
      it '電話番号は、半角数字以外が含まれている場合登録できないこと' do
        @order_shipping.phone_number = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Enter it as follows (e.g. 09012345678)")
      end
      it "tokenが空では登録できないこと" do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end