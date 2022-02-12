class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_fee, presence: true
  validates :bill, presence: true
  validates :payment, presence: true, inclusion: {in: [0, 1]}
  validates :order_progress, presence: true

  enum payment: { credit_card: 0, transfer: 1 }


  def shipping_fee
    800.to_s
  end

end
