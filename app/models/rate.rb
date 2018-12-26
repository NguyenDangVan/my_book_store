class Rate < ApplicationRecord
  belongs_to :user_id
  belongs_to :book_id

  validates :point, numericality: {only_interger: true, less_than_or_equal_to: 5}
end
