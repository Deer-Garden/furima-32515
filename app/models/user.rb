class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :fname, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :lname, presence:true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :email,presence: true,uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :birthday, presence: true
end
