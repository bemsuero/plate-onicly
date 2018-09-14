class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_secure_password
  has_and_belongs_to_many :interests
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  # VALID_PHONE_REGEX = /\d/m
  # validates :phone_number, presence: true, length: {minimum: 10, maximum: 10}, format: { with: VALID_PHONE_REGEX }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
