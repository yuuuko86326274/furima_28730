class CreatePurchaseItems < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_items do |t|
      t.references :item,   null: false, forein_key: true
      t.references :user,   null: false, forein_key: true
      t.timestamps
    end
  end
end
