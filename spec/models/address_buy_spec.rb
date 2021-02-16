require 'rails_helper'

RSpec.describe AddressBuy, type: :model do
  describe '購入情報の保存' do
    before do
      @address_buy = FactoryBot.build(:address_buy)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_buy).to be_valid
    end

    it 'post_codeが空だと保存できないこと' do
      @address_buy.post_code = ''
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @address_buy.post_code = '1234567'
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Post code is invalid")
    end
    it '都道府県がからだと保存できないこと' do
      @address_buy.prefecture_id = ''
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end
    it '都道府県が0以外でないと登録できないこと ' do
      @address_buy.prefecture_id = 0
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'cityは空でも保存でないこと' do
      @address_buy.city = ''
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空でも保存できない' do
      @address_buy.house_number = ''
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @address_buy.phone_number = ''
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが半角のハイフンを含んでいない正しい形式でないとと保存できないこと' do
      @address_buy.phone_number = '090-1234-5678'
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが半角のハイフンを含んでいない11桁以内でないと保存できないこと' do
      @address_buy.phone_number = '090123456789'
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @address_buy.token = nil
      @address_buy.valid?
      expect(@address_buy.errors.full_messages).to include("Token can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @address_buy.building_name = ''
      @address_buy.valid?
      expect(@address_buy).to be_valid
    end
  end
end
