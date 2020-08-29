require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do

    end

    it "nameが空では登録できないこと" do

    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do

    end
    it "passwordが6文字以上であれば登録できること" do

    end

    it "passwordが5文字以下であれば登録できないこと" do

    end
    it "重複したemailが存在する場合登録できないこと" do

    end
  end
end
