class ItemTagRelation < ApplicationRecord
  belongs_to :image
  belongs_to :tag
end
