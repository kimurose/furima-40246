require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
   context '正常系' do
    it '必要事項を全て過不足なく入力すると登録できる' do
      expect(@item).to be_valid
    end
   end

   context '異常系' do
    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      expect(@item).not_to be_valid
    end
    it '画像が必要であること' do
      @item.image = nil
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では出品できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    
    it '説明が空では出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
  
    it 'カテゴリーが1以外であること' do
      @item.category_id = 1
      expect(@item).to be_invalid
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態が1以外であること' do
      @item.condition_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担が1以外であること' do
      @item.delivery_cost_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
    end
    it '発送元の地域が1以外であること' do
      @item.prefecture_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数が1以外であること' do
      @item.shipping_day_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it '販売価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は半角での入力でないと登録できない' do
      @item.price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it '販売価格は数値での入力でないと登録できない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it '販売価格が300円未満では登録できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it '販売価格が9,999,999円を超えると登録できない' do
      @item.price = '10,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
   end
  end
end
