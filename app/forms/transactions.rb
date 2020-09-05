class Transactions

  include ActiveModel::Model
  attr_accessor :token,:postal_code,:delivery_area_id,:city,:address_num,:building_name,:tel,:user_id,:item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :delivery_area_id, numericality:{ other_than: 0 }
    validates :city
    validates :address_num
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # user = User.create(nickname: nickname, email: email, password: password, first_name: first_name, last_name: last_name, first_name_pkey: first_name_pkey, last_name_pkey: last_name_pkey, birthday: birthday)
    # item = Item.create(image: image, name: name, item_text: item_text, price: price, category_id: category_id, item_status_id: item_status_id, delivery_burden_id: delivery_burden_id, delivery_area_id: delivery_area_id, delivery_days_id: delivery_days_id, user_id: user_id)
    purchase_item = PurchaseItem.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address_num: address_num, building_name: building_name, tel: tel, purchase_item: purchase_item)
  end
end