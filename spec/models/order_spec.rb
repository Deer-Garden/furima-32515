require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "保存ができる場合" do
    expect(@order).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it 'userが紐付いていないと保存できないこと' do
    @order.user = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User must exist")
  end

  it 'itemが紐付いていないと保存できないこと' do
    @order.item = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item must exist")
  end
end