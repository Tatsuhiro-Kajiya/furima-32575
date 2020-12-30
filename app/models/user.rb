class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々+\z]/
    VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    
    validates :nickname
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Input Cannot be registered with a mixture of half-width alphanumeric characters " }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters." }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters." }
    validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters." }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
end
