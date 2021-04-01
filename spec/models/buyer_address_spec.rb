require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @user = FactoryBot.build_stubbed(:user)
    @item = FactoryBot.build_stubbed(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
  end

  describe "商品購入" do
    context '購入できる時' do
      it "全て記入されていれば決済ができること" do
        expect(@buyer_address).to be_valid
      end
      it "buildingがなくても決済ができること" do
        @buyer_address.building = nil
        expect(@buyer_address).to be_valid
      end
      it "telephoneが10ケタでも決済ができること" do
        @buyer_address.telephone = 1234567890
        expect(@buyer_address).to be_valid
      end
    end

    context '購入できない時' do
      it "tokenが空では決済ができないこと" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では決済ができないこと" do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it "postal_codeが数字のみでは決済できないこと" do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "cityが空では決済ができないこと" do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では決済ができないこと" do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it "telephoneが空では決済ができないこと" do
        @buyer_address.telephone = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it "telephoneが8ケタでは決済ができないこと" do
        @buyer_address.telephone = '12345678'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it "telephoneが12ケタでは決済ができないこと" do
        @buyer_address.telephone = '123456789000'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it "telephoneが半角以外では決済ができないこと" do
        @buyer_address.telephone = "123-45678-9000"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it "telephoneが全角では決済ができないこと" do
        @buyer_address.telephone = "０８０-１２３４-５６７８"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone is invalid")
      end
      it "province_idが0では決済ができないこと" do
        @buyer_address.province_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Province must be other than 0")
      end
      it "userが紐づいてないと出品できない" do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいてないと出品できない" do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
