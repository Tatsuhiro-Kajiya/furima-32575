require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe '新規登録/ユーザー情報' do
    context 'ユーザー新規登録がうまくいく時' do
      it "ニックネームが登録できる" do
        @user.nickname = "aaa"
        expect(@user).to be_valid
      end
      it "メールアドレスが登録できる" do
        @user.email = "aaa@gamil.com"
        expect(@user).to be_valid
      end
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        expect(@user).to be_valid
      end
      it "メールアドレスは、＠を含む必要があること" do
        @user.email = "aaa@gmail.com"
        expect(@user).to be_valid
      end
      it "パスワードが登録できる" do
        @user.password = "a12345"
        expect(@user).to be_valid
      end
      it "パスワードは、6文字以上であること" do
        @user.password = "123456"
        expect(@user).to be_valid
      end
      it "パスワードは、半角英数字混合であること" do
        @user.password = "a12345"
        expect(@user).to be_valid
      end
      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password = "123456"
        @user.encrypted_password = "123456"
        expect(@user).to be_valid
      end
      it "パスワードとパスワード(確認用)、値の一致している" do
        @user.password = "123456"
        @user.encrypted_password = "123456"
        expect(@user).to be_valid
      end
      it "ユーザー本名は、名字と名前がそれぞれ登録できる" do
        @user.last_name = "山田"
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "ユーザー本名は、全角(漢字・ひらがな・カタカナ)での入力ができる" do
        @user.last_name = "山田","やまだ","ヤマダ"
        @user.first_name = "太郎","たろう","タロウ"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、名字と名前でそれぞれ登録できる" do
        @user.last_name_kana = "ヤマダ"
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力ができる" do
        @user.last_name_kana = "ヤマダ"
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
      it "生年月日が登録できる" do
        @user.birthday = "2020-01-01"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "パスワードが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "パスワードが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが存在しても確認用パスワードが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードとパスワード(確認用)、値の一致しないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は、名字と名前がそれぞれ空だと登録できない" do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end
      it "ユーザー本名のフリガナは、名字と名前でそれぞれ空だと登録できない" do
        @user.last_name_kana = ""
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
