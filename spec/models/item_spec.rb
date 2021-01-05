require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいく時' do
      it "全てが揃っていれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it "出品画像が添付されていないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空だと出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが1だと出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が1だと出品できない" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "配送料の負担が1だと出品できない" do
        @item.shopping_cost_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost must be other than 1")
      end
      it "発送元の地域が0だと出品できない" do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "発送までの日数が1だと出品できない" do
        @item.shopping_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping days must be other than 1")
      end
      it "販売価格が空だと出品できない" do
        @item.price_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が全角だと出品できない" do
        @item.price_id = "１２３４ABC"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers.")
      end
      it "販売価格が漢字だと出品できない" do
        @item.price_id = "一二三四五六"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers.")
      end
      it "販売価格が¥300~¥9999999の間以外だと出品できない" do
        @item.price_id = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width numbers.")
      end
    end
  end
end
