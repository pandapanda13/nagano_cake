class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :production_progress, presence: true

  enum production_progress: { unstarted: 0, waiting: 1, in_progress: 2, completed: 3 }
end
