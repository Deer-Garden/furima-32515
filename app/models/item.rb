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
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :ship_method_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :ship_date_id, numericality: { other_than: 1 }
    validates :image

  end

end
