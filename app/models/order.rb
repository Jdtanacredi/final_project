class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  #has_one :product, through: :sku

  #if order.expired?
    #DO STUFF

  #end

end
