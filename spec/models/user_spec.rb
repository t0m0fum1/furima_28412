require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、password、password_confirmation、firstname、lastname、firstname-furigana、lastname-furigana、birthdayが存在すれば登録できること" do
    end

    it "nameが空では登録できないこと" do
    end

    it "emailが空では登録できないこと" do
    end

    it "passwordが空では登録できないこと" do
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
    end

    it "firstnameが空では登録できないこと" do
    end

    it "lastnameが空では登録できないこと" do
    end

    it "firstname_furiganaが空では登録できないこと" do
    end

    it "lastname_furiganaが空では登録できないこと" do
    end

    it "birthdayが空では登録できないこと" do
    end

    it "nameが40文字以内であれば登録できること" do
    end

    it "nameが41文字以上であれば登録できないこと" do
    end

    it "passwordが6文字以上であれば登録できること" do
    end

    it "passwordが5文字以下であれば登録できないこと" do
    end

    it "重複したemailが存在する場合登録できないこと" do
    end

    it "firstnameが全角であること" do
    end

    it "lastnameが全角であること" do
    end

    it "firstname_furiganaが全角カナであること" do
    end

    it "lastname_furiganaが全角カナであること" do
    end

  end
end
