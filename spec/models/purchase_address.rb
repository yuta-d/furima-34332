require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入がうまくいくとき' do
      it "postal_code, prefecture_id, city, number, telephone,tokenが正しく入力されていれば購入できる" do
        expect(@purchase_address).to be_valid
      end

      it "build_nameが空でも購入できる" do
        @purchase_address.build_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("郵便番号を入力してください")
      end

      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @purchase_address.postal_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("郵便番号は無効です")
      end

      it 'prefectureが未選択だと購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("都道府県を入力してください")
      end

      it 'cityが空だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("市区町村を入力してください")
      end

      it 'address_numberが空だと購入できない' do
        @purchase_address.address_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("番地を入力してください")
      end

      it 'telephoneが空だと購入できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("電話番号を入力してください")
      end

      it 'telephoneが11桁いないでないと購入できない' do
        @purchase_address.telephone = '111111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("電話番号は無効です")
      end

      it 'telephoneが半角の数値でないと購入できない' do
        @purchase_address.telephone = '１１１１１１１１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("電話番号は無効です")
      end

      it 'telephoneが英数字混合では購入できない' do
        @purchase_address.telephone = '111111aaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("電話番号は無効です")
      end

      it "tokenが空では購入できないこと" do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tokenを入力してください")
      end

      it "user_idが空だとと購入できない" do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end

      it "item_idが空だと購入できない" do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end

