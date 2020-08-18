class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :burden, :shipping_origin, :days
  belongs_to :user
  has_one_attached :image
  
  validates :name, :explain, :category, :status, :burden, :shipping_origin, :days, :fee, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :shipping_origin_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }
end
