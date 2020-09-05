class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :item_text,            null: false
      t.integer :price,             null: false
      t.references :user,           null: false, forein_key: true
      t.integer :category_id,       null: false
      t.integer :item_status_id,    null: false
      t.integer :delivery_burden_id, null: false
      t.integer :delivery_area_id,  null: false
      t.integer :delivery_days_id,  null: false
      t.timestamps
    end
  end
end
