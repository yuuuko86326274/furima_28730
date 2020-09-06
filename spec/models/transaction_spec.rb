require 'rails_helper'

RSpec.describe Transactions, type: :model do
  describe '購入者の情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, image: fixture_file_upload('public/images/camera.png'), user_id: user.id)
      @transaction = FactoryBot.build(:transactions, user_id: user.id, item_id: item.id)
    end
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@transaction).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @transaction.building_name = nil
        expect(@transaction).to be_valid
      end
      it 'postal_codeはハイフンが入った郵便番号であればできること' do
        @transaction.postal_code
        expect(@transaction).to be_valid
      end
    end
    context '保存がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'delivery_area_idが空、もしくは---指定だと保存できないこと' do
        @transaction.delivery_area_id = "0"
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Delivery area must be other than 0")
      end
      it 'cityが空だと保存できないこと' do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numが空だと保存できないこと' do
        @transaction.address_num = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Address num can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @transaction.tel = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Tel can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @transaction.token = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角数字のハイフン入りの郵便番号でなければ保存できないこと' do
        @transaction.postal_code = '333jjjj'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが半角数字3桁、ハイフン、半角数字4桁の状態（例：111-1111）でないと保存できないこと' do
        @transaction.postal_code = '333-jjj'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Postal code is invalid')
      end
      it 'telが半角11桁の数字でなければ保存できないこと' do
        @transaction.tel = '1234567890'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Tel is invalid')
      end
      it 'telがハイフン入りでは保存できないこと' do
        @transaction.tel = '123-456-890'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
