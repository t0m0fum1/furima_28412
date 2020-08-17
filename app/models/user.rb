class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :name, presence: true, length: { maximum: 40 }
  validates :birthday, presence: true

  with_options presence: true do |existence|
    existence.validates :firstname, format: { with: /\A[一-龥]+\z/ }
    existence.validates :lastname, format: { with: /\A[一-龥]+\z/ }
  end
  
  with_options presence: true do |existence|
    existence.validates :firstname_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    existence.validates :lastname_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
