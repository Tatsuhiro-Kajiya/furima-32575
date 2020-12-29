class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々+\z]/, message: "is invalid. Input full-width characters." }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々+\z]/, message: "is invalid. Input full-width characters." }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
  with_options presence: true do
    VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Input Cannot be registered with a mixture of half-width alphanumeric characters " }
  end
end
