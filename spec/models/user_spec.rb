require 'rails_helper'
require 'securerandom'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nameとemail、password、password_confirmation、firstname、lastname、firstname-furigana、lastname-furigana、birthdayが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'nameが40文字以内であれば登録できること' do
          @user.name = SecureRandom.alphanumeric(40)
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = '12345a'
          @user.password_confirmation = '12345a'
          expect(@user).to be_valid
        end

        it 'firstname_furiganaが全角カナであれば登録できること' do
          @user.firstname_furigana = 'タナカ'
          expect(@user).to be_valid
        end

        it 'lastname_furiganaが全角カナであれば登録できること' do
          @user.lastname_furigana = 'タナカ'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nameが空では登録できないこと' do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordは半角英数字混合でなければ登録できないこと' do
          @user.password = '２２２ABC'
          @user.password_confirmation = '２２２ABC'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'firstnameが空では登録できないこと' do
          @user.firstname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname can't be blank")
        end

        it 'lastnameが空では登録できないこと' do
          @user.lastname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname can't be blank")
        end

        it 'firstname_furiganaが空では登録できないこと' do
          @user.firstname_furigana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname furigana can't be blank")
        end

        it 'lastname_furiganaが空では登録できないこと' do
          @user.lastname_furigana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname furigana can't be blank")
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'nameが41文字以上であれば登録できないこと' do
          @user.name = SecureRandom.alphanumeric(41)
          @user.valid?
          expect(@user.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'firstname_furiganaが全角でなければ登録できないこと' do
          @user.firstname_furigana = 'ﾀﾅｶ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Firstname furigana is invalid')
        end

        it 'lastname_furiganaが全角でなければ登録できないこと' do
          @user.lastname_furigana = 'ﾀﾅｶ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Lastname furigana is invalid')
        end
      end
    end
  end
end
