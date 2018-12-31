class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, through: :orders

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: Settings.users.name.maximum}
  validates :email, presence: true, length: {maximum: Settings.users.email.maximum},
    uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

  before_save {email.downcase!}
  has_secure_password

  scope :get_by_role, -> role{where role: role}
end
