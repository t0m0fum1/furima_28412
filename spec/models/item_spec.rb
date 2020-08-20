require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it 'image、name、explain、category、status、burden、shipping_origin、day、feeが存在すれば出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき ' do
      it 'imageが空なら登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空なら登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explainが空なら登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'feeが空なら登録できない' do
        @item.fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'category_idが1ならば出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1でならば出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'burden_idが1でならば出品できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it 'shipping_origin_idが1でならば出品できない' do
        @item.shipping_origin_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping origin must be other than 1')
      end
      it 'day_idが1でならば出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'feeが空なら登録できない' do
        @item.fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it 'feeが300未満なら出品できない' do
        @item.fee = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be greater than or equal to 300')
      end
      it 'feeが9,999,999を超えているなら出品できない' do
        @item.fee = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be less than or equal to 9999999')
      end
    end
  end
end
