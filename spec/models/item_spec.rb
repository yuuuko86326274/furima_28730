require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品商品の保存' do
    before do
      @user = FactoryBot.create(:user) 
      @item = FactoryBot.build(:item,user_id:@user.id)
    end


    context '出品がうまくいくとき' do
      it '全ての値が正しく入力されていたら保存できること' do
        # binding.pry
        expect(@item).to be_valid
      end

      it 'priceの範囲が、半角数字の入力で、¥300〜¥9,999,999だと保存できること'do
        @item.price = 400
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'item_textが空だと保存できないこと' do
        @item.item_text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end

      it 'priceが空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idが空だと保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'item_status_idが空だと保存できないこと' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
      end

      it 'delivery_burden_idが空だと保存できないこと' do
        @item.delivery_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank", "Delivery burden is not a number")
      end

      it 'delivery_area_idが空だと保存できないこと' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank", "Delivery area is not a number")
      end

      it 'delivery_days_idが空だと保存できないこと' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank", "Delivery days is not a number")
      end

      it 'priceの範囲が、¥300〜¥9,999,999以外だと保存できないこと'do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceは半角数字のみの入力で保存できること' do
        @item.price = "だめ"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
