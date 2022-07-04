class Order < ApplicationRecord

  has_many :order_detail, dependent: :destroy
  belongs_to :customer

  def subtotal
    item.price*1.08*amount
  end

  enum payment_method: { "クレジットカード": 0, "銀行振り込み": 1}

end
