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
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '電話番号にはハイフンが不要であり、11桁以内であること' do
        @user_order.phone = "123456787654321"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone can't be blank")
      end

      it '' do
        
      end

      it '' do
        
      end

      it '' do
        
      end

      it '' do
        
      end

      it '' do
        
      end

      it '' do
        
      end
    end


  end

end
