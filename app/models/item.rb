class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefecture


  with_options  presence: true do
    validates :name
    validates :text
    validates :image
    validates :price
  end

  with_options  numericality: { other_than: 0 } do
    validates :category
    validates :condition
    validates :delivery_day
    validates :delivery_charge
    validates :prefecture
  end

  validates :price, format: { with: /\A[0-9]+\z/}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999 }

end
