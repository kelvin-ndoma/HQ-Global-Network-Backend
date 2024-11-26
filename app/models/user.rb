class User < ApplicationRecord
  # Add validations to ensure the necessary fields are present and properly formatted
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :status, inclusion: { in: [0, 1], message: "must be either 0 (inactive) or 1 (active)" }
  validates :role, inclusion: { in: [0, 1, 2], message: "must be 0 (user), 1 (admin), or 2 (moderator)" }

  # Password handling with bcrypt
  has_secure_password

  # Associations (if needed in the future)
  # Example: has_many :posts, has_many :comments, etc.

  # Attributes - serialization of complex fields
  serialize :user_attributes, Hash, coder: JSON
  serialize :social_links, Array, coder: JSON
  serialize :languages, Array, coder: JSON
  serialize :skills, Array, coder: JSON
  serialize :interests, Array, coder: JSON

  # Callbacks (optional)
  before_save :set_default_status

  private

  def set_default_status
    self.status ||= 1 # Set default status to 'active' if not provided
  end
end
