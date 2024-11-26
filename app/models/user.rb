class User < ApplicationRecord
    # Adds methods to set and authenticate against a bcrypt password
    has_secure_password
    
    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_digest, presence: true
    validates :bio, length: { maximum: 500 }, allow_nil: true
    validates :city, :country, :role, presence: true
  
    # Enum for status and role
    enum status: { active: 0, inactive: 1, banned: 2 }
    enum role: { user: 0, admin: 1, moderator: 2 }
  
    # Skills, interests, and languages stored as arrays
    serialize :skills, Array
    serialize :interests, Array
    serialize :languages, Array
  
    # Store user attributes as a JSON object or serialized hash
    serialize :user_attributes, Hash
  
    # Optional: Full name method for convenience
    def full_name
      "#{first_name} #{last_name}"
    end
  end
  