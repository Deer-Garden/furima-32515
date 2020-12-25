require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '#create' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end
    
    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end

      it '建物名は入力しなくても保存できる' do
        @user_order.build = nil
        expect(@user_order).to be_valid
      end
    end

    context '保存できない場合' do
      it '郵便番号がないと保存されない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県がないと保存されない' do
        @user_order.prefecture = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村区がないと保存されない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと保存されない' do
        @user_order.street = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号がないと保存されない' do
        @user_order.phone = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone can't be blank")
      end

      it '郵便番号にはハイフンがないと保存されない' do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end

      it '電話番号にはハイフンが不要であり、11桁以内であること' do
        @user_order.phone = "123456787654321"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone is invalid")
      end

      it '電話番号は数字でないと保存できない' do
        @user_order.phone = "aaaaaaaaaaaaaa"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone is invalid")
      end

      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    
      it 'userが空だと保存できないこと' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
    
      it 'itemが空だと保存できないこと' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end


  end

end
