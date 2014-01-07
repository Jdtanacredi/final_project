class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku

  if order.expired?
    #DO STUFF

  end

end
