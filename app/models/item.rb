class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_source
  has_one_attached :image
  belongs_to :user
  #has_one :order,dependent: :destroy

  validates :title, :description, :price, :image, presence: true

  validates :category_id, :condition_id, :delivery_charge_id, :shipping_day_id, :shipping_source_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "must be between ¥300 and ¥9,999,999" }
end
