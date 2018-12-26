class Cart < ApplicationRecord
  belongs_to :order_id
  belongs_to :book_id

  validates :quantity, numericality: {only_interger: true, less_than_or_equal_to: 5}
end
