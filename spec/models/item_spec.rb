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

    context "商品出品ができないとき" do
      it "商品名が空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "画像がなしでは出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "商品説明が空では出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "商品カテゴリーが空では出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "商品状態が空では出品できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "配達日数が空では出品できない" do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day is not a number")
      end
      it "配送エリアが空では出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "配送料金が空では出品できない" do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it "料金が空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "料金が半角数字意外では出品できない" do
        @item.price = "２３２３"
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "料金が¥300~¥9,999,999の間でないと出品できない" do
        @item.price = "10"
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end