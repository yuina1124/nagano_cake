class Order < ApplicationRecord

  has_many :order_detail, dependent: :destroy
  belongs_to :customer

def subtotal
  item.price*1.08*amount
end

end
