class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, length: {maximum: 40}
         validates :firstname, presence: true, format: {with: /\A[一-龥]+\z/ }
         validates :lastname, presence: true,format: {with: /\A[一-龥]+\z/ }
         validates :firstname_furigana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :lastname_furigana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
end
