require 'rails_helper'

RSpec.describe ItemsTag, type: :model do
  describe '出品情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @items_tag = FactoryBot.build(:items_tag,  images: fixture_file_upload('public/images/camera.png'), user_id: user.id)
    end

    context '出品がうまくいくとき' do
      it '全ての値が正しく入力されていたら保存できること' do
        expect(@items_tag).to be_valid
      end

      it 'priceの範囲が、半角数字の入力で、¥300〜¥9,999,999だと保存できること' do
        @items_tag.price
        expect(@items_tag).to be_valid
      end

      it 'tag_nameがなくても保存できること' do
        @items_tag.tag_name = nil
        expect(@items_tag).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空だと保存できないこと' do
        @items_tag.images = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Images can't be blank")
      end

      it 'nameが空だと保存できないこと' do
        @items_tag.name = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Name can't be blank")
      end

      it 'item_textが空だと保存できないこと' do
        @items_tag.item_text = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Item text can't be blank")
      end

      it 'priceが空だと保存できないこと' do
        @items_tag.price = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idが空だと保存できないこと' do
        @items_tag.category_id = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it 'item_status_idが空だと保存できないこと' do
        @items_tag.item_status_id = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Item status can't be blank", 'Item status is not a number')
      end

      it 'delivery_burden_idが空だと保存できないこと' do
        @items_tag.delivery_burden_id = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Delivery burden can't be blank", 'Delivery burden is not a number')
      end

      it 'delivery_area_idが空だと保存できないこと' do
        @items_tag.delivery_area_id = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Delivery area can't be blank", 'Delivery area is not a number')
      end

      it 'delivery_days_idが空だと保存できないこと' do
        @items_tag.delivery_days_id = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("Delivery days can't be blank", 'Delivery days is not a number')
      end

      it 'priceが、¥300より安いと保存できないこと' do
        @items_tag.price = '299'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが、¥9,999,999より高いと保存できないこと' do
        @items_tag.price = '10000000'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは半角数字のみの入力で保存できること' do
        @items_tag.price = 'だめ'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end

