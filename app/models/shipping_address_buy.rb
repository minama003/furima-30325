class ShippingAddressBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name , :phone_number

  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, format: {with: /\A\d{11}[-]\z/ }

  def save
    item = Item.create(name: name, text: text, condition_id: condition_id, delivery_charge_id:delivery_charge_id, delivery_day_id: delivery_day_id,prefecture_id: prefecture_id, category_id: category_id, price: price)
    user = User.create(nickname: nickname, first_name: first_name, last_name: last_name, first_name_reading: first_name_reading, last_name_reading: last_name_reading ,birthday: birthday, email: email, password: password)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,buy_id: buy.id)
    Buy.create(item_id: item.id, user_id: user.id)
  end
end