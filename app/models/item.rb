class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivaliy_cost
  belongs_to :delivaliy_day
  belongs_to :prefecture

  with_options presence: true do
    validates :item_name
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :quality_id
      validates :delivaliy_cost_id
      validates :delivaliy_day_id
      validates :prefecture_id
    end
    validates :description
    validates :price
  end
end
