class User < ApplicationRecord
       # Include default devise modules. Others available are:
       # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
       devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable
     
       validates :nickname, presence: true
       validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
       validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
       validates :birthday, presence: true
       validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
     
       has_many :items
       has_many :orders
     end