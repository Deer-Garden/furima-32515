require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '保存できる場合' do
    it "tokenがあれば保存できる" do
      expect(@order).to be_valid
    end
  end

  context '保存できない場合' do
    it "tokenが空では登録できない" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
