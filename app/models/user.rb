class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龯ぁ-んァ-ンー－]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[一-龯ぁ-んァ-ンー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
end
