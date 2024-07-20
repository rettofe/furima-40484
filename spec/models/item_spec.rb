require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
  context '商品出品がうまくいくとき' do
    it 'すべての項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it '画像がないと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと保存できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it '商品の説明がないと保存できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報がないと保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態の情報がないと保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担の情報がないと保存できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end

    it '発送元の地域の情報がないと保存できない' do
      @item.shipping_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping source must be other than 1")
    end

    it '発送までの日数の情報がないと保存できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it '価格の情報がないと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が¥300未満だと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
    end
    
    it '価格が¥9,999,999を超えると保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '価格に半角数字以外が含まれていると出品できない' do
      @item.price = '100a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
    end
  end
end
end