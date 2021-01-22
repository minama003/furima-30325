class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z{6,}/i }
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  end
end
