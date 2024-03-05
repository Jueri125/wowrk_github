class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def full_name
    self.customer.last_name + " " + self.customer.first_name
  end

  def subtotal
    self.order_details.sum { |order_detail| order_detail.item.with_tax_price * order_detail.amount.to_i }
  end

  def item_count
    count = 0
    self.order_details.each do |order_detail|
      count += order_detail.amount
    end
    return count
  end
end
