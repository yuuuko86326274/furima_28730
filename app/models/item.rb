class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
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
    validates :price#, format: { with: \d[1-3]{3,7} }
    validates :user_id
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :delivery_days_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :delivery_days_id
  end
end


##  items テーブル

#| Column              | Type       | Option                                 |
#| image               | string     | null: false                            |
#| name                | string     | null: false                            |
#| item_text           | text       | null: false                            |
#| price               | integer    | null: false                            |
#| user                | references | null: false, forein_key: true          |
#| category_id         | integer    | null: false                            |
#| item_status_id      | integer    | null: false                            |
#| delivery_burden_id  | integer    | null: false                            |
#| delivery_area_id    | integer    | null: false                            |
#| delivery_days_id    | integer    | null: false                            |

### Association

#- belongs_to :user
#- has_one :purchase_item
#- belongs_to_active_hash :category
#- belongs_to_active_hash :item_status
#- belongs_to_active_hash :delivery_burden
#- belongs_to_active_hash :delivery_area
#- belongs_to_active_hash :delivery_days
