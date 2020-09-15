class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase_item, dependent: :destroy
  has_many_attached :images
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_days
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations, dependent: :destroy
end
