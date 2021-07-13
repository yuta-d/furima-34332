class PurchaseAddress
  include AcribeModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :number, :build_name, :telephone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code. format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :number
    validates :build_name
    validates :telephone, format: {with: /\A[0-9]{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, number: number, build_name: build_name, telephone: telephone, purchase_id: purchase_id )
  end