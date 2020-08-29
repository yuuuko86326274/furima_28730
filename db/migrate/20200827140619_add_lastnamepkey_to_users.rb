class AddLastnamepkeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name_pkey, :string
  end
end
