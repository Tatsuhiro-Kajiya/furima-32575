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
    validates :birthday
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Input Cannot be registered with a mixture of half-width alphanumeric characters " }
    with_options format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters." } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters." } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
