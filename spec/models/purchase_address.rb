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
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @purchase_address.postal_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Postal code is invalid.")
      end

      it 'prefectureが未選択だと購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("City can't be blank")
      end

      it 'address_numberが空だと購入できない' do
        @purchase_address.address_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Address number can't be blank")
      end

      it 'telephoneが空だと購入できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Telephone can't be blank")
      end

      it 'telephoneが11桁いないでないと購入できない' do
        @purchase_address.telephone = '111111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Telephone is invalid.")
      end

      it 'telephoneが半角の数値でないと購入できない' do
        @purchase_address.telephone = '１１１１１１１１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Telephone is invalid.")
      end

      it 'telephoneが英数字混合では購入できない' do
        @purchase_address.telephone = '111111aaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include ("Telephone is invalid.")
      end

      it "tokenが空では購入できないこと" do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

