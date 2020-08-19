class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :day

  belongs_to :user
  has_one_attached :image
  
  validates :name, :explain, :category, :status, :burden, :shipping_origin, :day, :fee, :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :shipping_origin_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }

  validates :fee, numericality: { greater_than_or_equal_to: 300 }
  validates :fee, numericality: { less_than_or_equal_to: 9999999 }

end
