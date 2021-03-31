class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :province_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

    validates :province_id, numericality: { other_than: 0 }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, province_id: province_id, city: city, address: address, building: building, telephone: telephone, buyer_id: buyer.id)
  end
end