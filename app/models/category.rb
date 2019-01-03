class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}

  scope :select_categories, -> {select :id, :name, :description}
  scope :get_by_name, -> t{where("name LIKE ?", "%#{t}%")}
end
