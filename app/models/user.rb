class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  has_one :profile

  after_create :create_profile

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true

  validate :validate_email_unique
 
  # NOTE, this is here just to demonstrate custom validators.
  # This can be accomplished using built in validators via the following:
  # validates :email, uniqueness { case_sensitive: false }
  def validate_email_unique
    existing = User.where("lower(email) = '#{email&.downcase}'")

    if existing.count > 0
      errors.add(:email, 'is already taken')
    end
  end
end
