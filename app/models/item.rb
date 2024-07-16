class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_source
  has_one_attached :image

  validates :title, :description, :price, presence: true

  validates :category_id, :condition_id, :delivery_charge_id, :shipping_day_id, :shipping_source_id, numericality: { other_than: 1 }
end
