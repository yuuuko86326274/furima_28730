class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    #validates :item_text 
  end
end
