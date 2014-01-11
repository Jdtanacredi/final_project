class Sku < ActiveRecord::Base
  belongs_to :product
  has_many :orders
  delegate :title, :description, :image_url, to: :product
end