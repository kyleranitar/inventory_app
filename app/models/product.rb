class Product < ApplicationRecord
  has_many :stocks
  has_many :warehouses, -> { distinct }, through: :stocks
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: {case_sensitive: false}
end
