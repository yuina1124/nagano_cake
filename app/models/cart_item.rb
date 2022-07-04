class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

def subtotal
  item.price*1.08*amount
end

end
