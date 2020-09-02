class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,           null: false
      t.integer :delivery_area_id,     null: false
      t.string :city,                  null: false
      t.string :adress_num,            null: false
      t.string :bilding_name
      t.string :tel,                   null: false
      t.references :purchase_item,     null: false, forein_key: true
      t.timestamps
    end
  end
end
