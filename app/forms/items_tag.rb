class ItemsTag

  include ActiveModel::Model
  attr_accessor :images,:name,:item_text,:price,:category_id,:item_status_id,:delivery_burden_id,:delivery_area_id,:delivery_days_id,:tag_name,:user_id,:id

  with_options presence: true do
    validates :images
    validates :name
    validates :item_text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :user_id
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :delivery_days_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_days_id
  end

  def save
    item = Item.create(name: name,item_text: item_text,price: price,category_id: category_id,item_status_id: item_status_id,delivery_burden_id: delivery_burden_id,delivery_area_id: delivery_area_id,delivery_days_id: delivery_days_id, images: images, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update
    item = Item.find(id)
    item.update(name: name,item_text: item_text,price: price,category_id: category_id,item_status_id: item_status_id,delivery_burden_id: delivery_burden_id,delivery_area_id: delivery_area_id,delivery_days_id: delivery_days_id, images: images, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    items_tag = ItemTagRelation.find_by(item_id: item.id)
    items_tag.update(item_id: id, tag_id: tag.id)
  end
end
