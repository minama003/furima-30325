class AddressBuy
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :house_number, :building_name , :phone_number

  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, format: {with: /\A\d{11}\z/ }
  validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
  validates :city,format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end