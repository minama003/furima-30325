require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'nameとtextとimageとpriceとcategory_idとcondition_idとdelivery_day_idとdelivery_charge_id、prefecture_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '画像がなしでは出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '商品カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品状態が空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '配達日数が空では出品できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day is not a number")
      end
      it '配送エリアが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '配送料金が空では出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it '料金が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it '料金が半角数字意外では出品できない' do
        @item.price = '２３２３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '料金が半角英数混合では登録できないこと' do
        @item.price = 'a1111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '料金が半角英語だけでは登録できないこと' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '料金が¥299円以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '料金が¥10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'カテゴリーが0以外でないと登録できないこと ' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '状態が0以外でないと登録できないこと ' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it '配送料が0以外でないと登録できないこと ' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it '配送日が0以外でないと登録できないこと ' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end
      it '配送エリアが0以外でないと登録できないこと ' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
    end
  end
end
