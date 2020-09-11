class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :day

  belongs_to :user
  has_one_attached :image
  has_one :buy, dependent: :destroy
  validates :name, :explain, :category, :status, :burden, :shipping_origin, :day, :fee, :image, presence: true

  with_options numericality: { other_than: 1 } do |number|
    number.validates :category_id
    number.validates :status_id
    number.validates :burden_id
    number.validates :shipping_origin_id
    number.validates :day_id
  end

  validates :fee, numericality: { greater_than_or_equal_to: 300 }
  validates :fee, numericality: { less_than_or_equal_to: 9_999_999 }
end
