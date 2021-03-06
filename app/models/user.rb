require "bcrypt"
class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_token
  has_many :tournaments, foreign_key: :user_id
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :password_confirmation_check

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_token
    SecureRandom::urlsafe_base64(32)
  end

  def add_school(school)

    self.school_id = school.id
    self.save

  end

  def is_password(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
    self.token
  end

  private
  def ensure_token
    self.token ||= self.class.generate_token
  end

  def password_confirmation_check
    unless self.password == self.password_confirmation
      add.errors("Your password and password confirmation must match.")
    end
  end

end
