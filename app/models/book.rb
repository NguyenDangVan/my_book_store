class Book < ApplicationRecord
  belongs_to :category_id
  belongs_to :author_id
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy

  validates :title, presence: true, length: {maximum: 200}
  validates :publisher, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
end
