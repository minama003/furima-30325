class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name
    validates :last_name
    validates :first_name_reading
    validates :last_name_reading
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z{6,}/i }
    validates :email, uniqueness: true, format: { with: /@.+/ }
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "Input full-width characters."} do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/,message: "Input full-width katakana characters."} do
    validates :first_name_reading
    validates :last_name_reading
  end

end
