class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :production_progress, presence: true

  enum production_progress: { unstarted: 0, before_progress: 1, in_progress: 2, completed: 3 }

  def add_tax_price
  (self.price * 1.10).floor
  end
end
