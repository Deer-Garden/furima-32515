class Item < ApplicationRecord

  has_many :comments
  has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_method
  belongs_to :area
  belongs_to :ship_date


  with_options presence: true do

    validates :name
    validates :price
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :ship_method_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :ship_date_id, numericality: { other_than: 1 }
    validates :user_id
  end

end
