class AddFirstnamepkeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_pkey, :string
  end
end
