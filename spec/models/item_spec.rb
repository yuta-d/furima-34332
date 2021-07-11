require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品情報入力がうまくいくとき' do
      it "item_name, description, category_id, quality_id,delivaliy_cost_id, delivaliy_day_id, prefecture_id, priceが存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context '商品情報入力がうまくいかないとき' do
      it 'imageが空だと出品できないこと' do
        @item.image = ''
        @item.valid?
        expect(@item).to be_valid
      end

      it 'item_nameが空だと出品できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end

      it 'descriptionが空だと出品できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end

      it 'categoryが未選択だと出品できないこと'do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category can't be blank")
      end

      it 'qualityが未選択だと出品できないこと' do
        @item.quality_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Quality can't be blank")
      end

      it 'delivaliy_costが未選択だと出品できないこと' do
        @item.delivaliy_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivaliy cost can't be blank")
      end

      it 'delivaliy_dayが未選択だと出品できないこと' do
        @item.delivaliy_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivaliy day can't be blank")
      end

      it 'prefectureが未選択だと出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end

      it 'priceが空だと出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end

      it 'priceが全角数字だと出品できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end

      it 'priceが半角英字のみでは出品できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end

      it 'priceが半角英数混合では出品できないこと' do
        @item.price = '1a2'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
    end
  end
end
