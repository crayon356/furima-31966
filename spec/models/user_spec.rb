require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context '登録できない時' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "email @がない場合は登録できない" do
      @user.email = 'abcsecon.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password confirmationが異なると登録できない" do
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = 'aaa00'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角英語のみでは登録できない" do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "苗字が空では登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "全角(漢字、ひらがな、カナ)以外では登録できない" do
      @user.family_name = 'miyoji'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "名前が空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名前が空では登録できない" do
      @user.first_name = 'namae'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "苗字(カナ)が空では登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "苗字(カナ)以外では登録できない" do
      @user.family_name_kana = 'みょうじ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "名前(カナ)が空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名前(カナ)以外では登録できない" do
      @user.first_name_kana = 'なまえ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
