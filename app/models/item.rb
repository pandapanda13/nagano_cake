class Item < ApplicationRecord
  has_one_attached :image_id
  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  validates :name, presence: true
  validates :image_id, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}

 def add_tax_price
  (self.price * 1.10).round
 end


end
