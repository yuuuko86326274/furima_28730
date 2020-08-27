class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :item_text,        null: false
      t.integer :price,         null: false
      t.timestamps
    end
  end
end


#実装済、##実装未済

##  items テーブル

#| Column              | Type       | Option                                 |
#| ------------------- | ---------- | -------------------------------------- |
#| image               | string     | ##null: false                            |
#| name                | string     | ##null: false                            |
#| item_text           | text       | ##null: false                            |
#| price               | integer    | null: false                            |
##| user                | references | null: false, forein_key: true          |
##| delivery_burden_id  | integer    | null: false                            |
##| delivery_area_id    | integer    | null: false                            |
##| delivery_days_id    | integer    | null: false                            |

### Association

##- belongs_to_active_hash :category
##- belongs_to_active_hash :delivery_burden
##- belongs_to_active_hash :delivery_area
##- belongs_to_active_hash :delivery_days
