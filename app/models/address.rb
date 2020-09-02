class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase_item
  belongs_to_active_hash :delivery_area

  with_options presance: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :delivery_area_id, numericality:{ other_than: 0 }
    validates :city
    validates :address_num
    validates :tel, format: { with: \d{11} }
    validates :purchase_item_id
  
  end
end
