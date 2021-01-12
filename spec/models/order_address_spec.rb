require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  
  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it '全てが揃っていれば登録できること' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_address.building_number = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "発送元の地域が0だと保存できない" do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が空だと保存できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_address.lot_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Lot number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字以外だと保存できない' do
        @order_address.phone_number = "123ABCDEFGH"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
