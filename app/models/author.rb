class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  validates :info, presence: true, length: {maximum: 500}
end
