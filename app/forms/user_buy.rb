class UserBuy
  
  include ActiveModel::Model

  attr_accessor :prefecture_id, :postal_code, :city, :address, :building_name, :tel, :item_id, :token,:user_id

  validates :prefecture_id, :postal_code, :city, :address, :tel, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}, length: {maximum: 8}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :tel, format: { with: /\A[0-9]{11}/},length: {maximum: 11}
 

  def save
    buy = Buy.create(user_id: user_id ,item_id: item_id)
    ShippingAddress.create(prefecture_id: prefecture_id,postal_code: postal_code,city: city,address: address,building_name: building_name,tel: tel,buy_id: buy.id)
  end

end