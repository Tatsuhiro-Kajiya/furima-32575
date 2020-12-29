require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe '新規登録/ユーザー情報' do
    it "ニックネームが必須であること" do
      @user.nickname = "aaa"
      expect(@user).to be_valid
    end
    it "メールアドレスが必須であること" do
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
    it "パスワードは必須であること" do
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
    it "パスワードとパスワード(確認用)、値の一致が必須であること" do
      @user.password = "123456"
      @user.encrypted_password = "123456"
      expect(@user).to be_valid
    end
  end

  describe '新規登録/本人確認' do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.last_name = "山田"
      @user.first_name = "太郎"
      expect(@user).to be_valid
    end
    it "ユーザー本名は、全角(漢字・ひらがな・カタカナ)での入力が必須であること" do
      @user.last_name = "山田","やまだ","ヤマダ"
      @user.first_name = "太郎","たろう","タロウ"
      expect(@user).to be_valid
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.last_name_kana = "ヤマダ"
      @user.first_name_kana = "タロウ"
      expect(@user).to be_valid
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "ヤマダ"
      @user.first_name_kana = "タロウ"
      expect(@user).to be_valid
    end
    it "生年月日が必須であること" do
      @user.birthday = "2020-01-01"
      expect(@user).to be_valid
    end
  end
end
