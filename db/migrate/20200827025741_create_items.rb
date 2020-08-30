class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :item_text,            null: false
      t.integer :price,             null: false
      t.references :user,           null: false
      t.integer :category_id,       null: false
      t.integer :item_status_id,    null: false
      t.integer :delivery_burden_id,null: false
      t.integer :delivery_area_id,  null: false
      t.integer :delivery_days_id,  null: false
      t.timestamps
    end
  end
end


#| Column              | Type       | Option                                 |
#| ------------------- | ---------- | -------------------------------------- |
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