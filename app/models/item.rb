class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  
  validates :name, :explain, :category, presence: true

  validates :category_id, numericality: { other_than: 1 }
end
