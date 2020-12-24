class UserOrder
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture, :city, :street, :build, :phone, :token, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street
    # validates :build
    validates :phone, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    # user = User.find(params[:user_id])
    # order = Order.find(params[:order_id])
    # item = Item.find(params[:item_id])
    order = Order.create(user_id: user_id, item_id: item_id)
    
    
    Address.create!(postal_code: postal_code, prefecture: prefecture, city: city, street: street, build: build, phone: phone, order_id: order.id)
  end

end