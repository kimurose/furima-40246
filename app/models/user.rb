class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :last_name, format: { with: /\A[一-龯ぁ-んァ-ン]+\z/ }
  validates :first_name, format: { with: /\A[一-龯ぁ-んァ-ン]+\z/ }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date, presence: true
  validates :password, format: { with: /\A.*[a-zA-Z].*\z/ }
end
