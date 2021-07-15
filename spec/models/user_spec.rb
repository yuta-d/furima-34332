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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複するemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが場合空の場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it "password_confirmationが空の場合は登録できないこと" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "first_nameが空の場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "family_nameが空の場合は登録できないこと" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it "birth_dayが空の場合は登録できないこと" do 
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "first_name_kanaが空では登録できないこと" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前(カナ)を入力してください")
      end
      it "family_name_kanaが空では登録できないこと" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("苗字(カナ)を入力してください")
      end
      it "first_name_kanaは全角カタカナ以外では登録できないこと" do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前(カナ)は無効です。カタカナで入力してください")
      end
      it "family_name_kanaは全角カタカナ以外では登録できないこと" do
        @user.family_name_kana = 'いちろう'
        @user.valid?
        expect(@user.errors.full_messages).to include ("苗字(カナ)は無効です。カタカナで入力してください")
      end
      it "first_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include ("名前は無効です。全角文字で入力してください")
      end
      it "family_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.family_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include ("苗字は無効です。全角文字で入力してください")
      end
      it "emailは@がなければ登録できないこと" do
        @user.email = 'testsample'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Eメールは不正な値です")
      end
      it "passwordは全角では登録できないこと" do
        @user.password = '１２３ABC'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは無効です")
      end
      it "passwordは数字のみでは登録できないこと" do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは無効です")
      end
      it "passwordは英語のみでは登録できないこと" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは無効です")
      end
    end  
  end
end
