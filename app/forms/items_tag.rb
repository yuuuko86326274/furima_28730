class ItemsTag

  include ActiveModel::Model
  attr_accessor : :name, :tag_name

  with_options presence: true do
    validates :name
    validates :tag_name
  end

  def save
    item = Item.create(name: name)
    tag = Tag.create(tag_name: tag_name)

    ItemTagRelation.create(item_id: item.id, tag_name_id: tag_name.id)
  end

end