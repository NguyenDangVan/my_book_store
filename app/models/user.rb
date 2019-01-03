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
  scope :select_users, ->{select :id, :name, :email, :phone, :created_at}
  scope :get_by_name_or_email, (lambda do |search|
    where("name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end)

  def is_role
    if self.role == 0
      return "User"
    else
      self.role == 1 ? "Admin" : "Shipper"
    end
  end

  def admin?
    self.role == 1 ? true : false
  end

  def shipper?
    self.role == 0 ? false : true
  end

  def load_permission_user; end
end
