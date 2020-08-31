class UserBuy
  include ActiveModel::Model

  attr_accessor :prefecture_id, :postal_code, :city, :address, :building_name, :tel, :item_id, :token, :user_id

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  TEL_REGEX = /\A[0-9]{11}/.freeze

  validates :prefecture_id, :postal_code, :city, :address, :tel, :token, presence: true
  validates :postal_code, format: { with: POSTAL_CODE_REGEX }, length: { maximum: 8 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :tel, format: { with: TEL_REGEX }, length: { maximum: 11 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, address: address, building_name: building_name, tel: tel, buy_id: buy.id)
  end
end
