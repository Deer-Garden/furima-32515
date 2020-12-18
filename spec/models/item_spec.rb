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

      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.price = 3000
        expect(@item).to be_valid
      end

    end

    context '出品できない場合' do
      it " 商品画像を1枚つけることが必須であること" do
        @item.image = nil
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
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "カテゴリーが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
  
      it "商品の状態についての情報が必須であること" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "商品の状態が1では登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
  
      it "配送料の負担についての情報が必須であること" do
        @item.ship_method_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship method can't be blank")
      end 

      it "配送料の負担が1では登録できない" do
        @item.ship_method_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship method must be other than 1")
      end
  
      it "発送元の地域についての情報が必須であること" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it "発送元の地域が1では登録できない" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
  
      it "発送までの日数についての情報が必須であること" do
        @item.ship_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end

      it "発送までの日数が1では登録できない" do
        @item.ship_date_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date must be other than 1")
      end
      
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格が下限以下(299円)では登録できない" do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が上限以上(10000000円)では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
