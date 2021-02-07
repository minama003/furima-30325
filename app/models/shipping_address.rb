class ShippingAddress < ApplicationRecord
  belongs_to :buy

  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, format: {with: VALID_PHONE_REGEX }
end
