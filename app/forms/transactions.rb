class Transactions
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :delivery_area_id, :city, :address_num, :building_name, :tel, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :city
    validates :address_num
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_item = PurchaseItem.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address_num: address_num, building_name: building_name, tel: tel, purchase_item: purchase_item)
  end
end
