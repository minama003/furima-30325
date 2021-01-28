class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name
    validates :last_name
    validates :first_name_reading
    validates :last_name_reading
    validates :password
    validates :email, uniqueness: true, format: { with: /@.+/ }
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Input full-width characters.' } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters.' } do
    validates :first_name_reading
    validates :last_name_reading
  end

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z{6,}/i, message: 'is invalid. Input half-width characters.' }
end
