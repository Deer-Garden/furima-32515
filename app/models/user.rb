class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  with_options presence: true do
    validates :nickname
    validates :email,uniqueness: true
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
    validates :password_confirmation
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :fname, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :lname, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
