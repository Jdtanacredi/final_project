class Sku < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  delegate :title, :description, :image_url, to: :product
end