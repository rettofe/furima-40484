class Item < ApplicationRecord
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :shipping_day
  belongs_to :shipping_source

  validates :title, :description, :price, presence: true

  validates :category_id, :condition_id, :delivery_charge_id, :shipping_day_id, :shipping_source_id, numericality: { other_than: 1 }
end
