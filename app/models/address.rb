class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase_item
  belongs_to_active_hash :delivery_area
end
