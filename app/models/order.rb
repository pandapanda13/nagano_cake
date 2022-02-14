class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_fee, presence: true
  validates :bill, presence: true
  validates :payment, presence: true
  validates :order_progress, presence: true

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_progress: { waiting: 0, paid: 1, in_progress: 2, preparing: 3, shipped: 4 }


  def shipping_fee
    800.to_s
  end

  def add_tax_price
  (self.price * 1.10).floor
  end

end
