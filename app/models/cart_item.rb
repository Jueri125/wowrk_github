class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer


  def subtotal
   item.with_tax_price * amount.to_i
  end
end

