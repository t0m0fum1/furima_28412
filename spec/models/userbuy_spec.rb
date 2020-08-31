require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  before do
    @buy = FactoryBot.build(:user_buy)
  end

  describe '商品の購入' do
    context '商品購入がうまくいくとき' do
      it "user_id、item_id、token、postal-code、prefecture-id、city、address、telが存在すれば購入できる" do
        expect(@buy).to be_valid
      end

      it "postal-codeが8文字以下であれば購入できる" do
        @buy.postal_code = "333-2222"
        expect(@buy).to be_valid
      end

      it "postal-codeが半角数字で4番目がハイフンであれば購入できる" do
        @buy.postal_code = "333-2222"
        expect(@buy).to be_valid
      end

      it "telが11文字以下の半角数字であれば購入できる" do
        @buy.tel = "11155558888"
        expect(@buy).to be_valid
      end

    end

    context '商品購入がうまくいかないとき' do
      it "postal-codeが空であれば購入できない" do
        @buy.postal_code = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefecture-idが空であれば購入できない" do
        @buy.prefecture_id = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空であれば購入できない" do
        @buy.city = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空であれば購入できない" do
        @buy.address = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end
      it "telが空であれば購入できない" do
        @buy.tel = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tel can't be blank")
      end
      it "postal-codeが9文字以上ならば購入できない" do
        @buy.postal_code = "111-22222"
        @buy.valid?
        expect(@buy.errors.full_messages).to include ("Postal code is too long (maximum is 8 characters)")
      end
      it "postal-codeの4番目がハイフン以外なら購入できない" do
        @buy.postal_code = "11113333"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefecture-idが1であれば購入できない" do
        @buy.prefecture_id = '1'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "telが12文字以上の半角数字であれば購入できない" do
        @buy.tel = "000999988881"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
    end
  end
end
