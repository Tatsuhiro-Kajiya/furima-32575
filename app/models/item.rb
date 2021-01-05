class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :price_id, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers.",  greater_than_or_equal_to:300 ,less_than_or_equal_to:9999999}
    validates :image
  end
  with_options numericality: { other_then: 1 } do
    validates :category_id
    validates :state_id
    validates :shopping_cost_id
    validates :prefecture_id
    validates :shopping_days_id
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shopping_cost
  belongs_to :prefecture
  belongs_to :shopping_days
end
