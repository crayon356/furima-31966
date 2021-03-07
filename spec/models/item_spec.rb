require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品新規登録" do
    context '出品できる時' do
      it "項目全てに入力されていれば登録できる" do
        expect(@item).to be_valid
      end
      it "金額が半角数字ならば出品できる" do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it "金額が300以上9999999以下ならば出品できる" do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
  
    context '出品できない時' do
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "category_idが0だと出品できない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "state_idが0だと出品できない" do
        @item.state_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end
      it "province_idが0だと出品できない" do
        @item.province_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Province must be other than 0")
      end
      it "souryou_idが0だと出品できない" do
        @item.souryou_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Souryou must be other than 0")
      end
      it "day_idが0だと出品できない" do
        @item.day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end
      it "priceが300以下だと出品できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999以上だと出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "commentがないとだと出品できない" do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it "imageがないとだと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "userが紐づいてないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end


end
