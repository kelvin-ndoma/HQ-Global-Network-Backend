class User < ApplicationRecord
  has_secure_password

  # Enum for user roles with integers for better performance
  enum role: { normal: 0, admin: 1 }, _default: :normal

  # Validations for presence
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :city, presence: true
  validates :country, presence: true

  # Optional: Custom method to check if the user is an admin
  def admin?
    role == 'admin'
  end
end
