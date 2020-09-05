class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase_item
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_days

  with_options presence: true do
    validates :image
    validates :name
    validates :item_text
    validates :price, inclusion: { in: 300..9_999_999 }
    validates :user_id
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :delivery_days_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_days_id
  end
end
