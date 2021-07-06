require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end
      context '新規登録がうまう行くとき' do
        it "nickname, email, first_name, family_name, first_name_kana, family_name_kana, birthdayが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上で、半角英数字の混合であれば登録できること" do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          @user.valid?
          expect(@user).to be_valid
        end
      end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
      it "重複するemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが場合空の場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "password_confirmationが空の場合は登録できないこと" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空の場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
      it "family_nameが空の場合は登録できないこと" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank")
      end
      it "birth_dayが空の場合は登録できないこと" do 
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors[:birth_day]).to include("can't be blank")
      end
      it "first_name_kanaが空では登録できないこと" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include ("can't be blank")
      end
      it "family_name_kanaが空では登録できないこと" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include ("can't be blank")
      end
      it "first_name_kanaは全角カタカナ以外では登録できないこと" do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid. Input full-width katakana characters.")
      end
      it "family_name_kanaは全角カタカナ以外では登録できないこと" do
        @user.family_name_kana = 'いちろう'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name kana is invalid. Input full-width katakana characters.")
      end
      it "first_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid. Input full-width characters.")
      end
      it "family_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.family_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name is invalid. Input full-width characters.")
      end
      it "emailは@がなければ登録できないこと" do
        @user.email = 'testsample'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it "passwordは全角では登録できないこと" do
        @user.password = '１２３ABC'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid.")
      end
      it "passwordは数字のみでは登録できないこと" do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid.")
      end
      it "passwordは英語のみでは登録できないこと" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid.")
      end
    end  
  end
end
