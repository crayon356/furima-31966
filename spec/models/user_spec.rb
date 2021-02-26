require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000aaa", family_name: "aaa", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "000aaa", password_confirmation: "000aaa", family_name: "aaa", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "000aaa", family_name: "aaa", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password confirmationが異なると登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000000", family_name: "aaa", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "苗字が空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000aaa", family_name: "", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "名前が空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000aaa", family_name: "aaa", first_name: "", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "苗字(カナ)が空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000aaa", family_name: "aaa", first_name: "aaa", family_name_kana: "", first_name_kana: "aaa", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "名前(カナ)が空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000aaa", family_name: "aaa", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "000aaa", password_confirmation: "000aaa", family_name: "aaa", first_name: "aaa", family_name_kana: "aaa", first_name_kana: "aaa", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
