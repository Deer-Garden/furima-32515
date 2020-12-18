require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる場合' do
      it "必要な情報を適切に入力すると、商品の出品ができること" do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it " 商品画像を1枚つけることが必須であること" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it "商品名が必須であること" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it "商品の説明が必須であること" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
  
      it "カテゴリーの情報が必須であること" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
  
      it "商品の状態についての情報が必須であること" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status_id can't be blank")
      end
  
      it "配送料の負担についての情報が必須であること" do
        @item.ship_method = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship_method can't be blank")
      end 
  
      it "発送元の地域についての情報が必須であること" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area_id can't be blank")
      end
  
      it "発送までの日数についての情報が必須であること" do
        @item.ship_date = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship_date can't be blank")
      end
  
      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
