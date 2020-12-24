class Order < ApplicationRecord
  belongs_to :item
  attr_accessor :token
  validates :token, presence: true
  
end
