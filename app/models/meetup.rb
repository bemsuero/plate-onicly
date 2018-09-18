class Meetup < ApplicationRecord
  has_many :meetup_users
  has_many :users, through: :meetup_users
  belongs_to :guest_user
def generate_slug
  self.slug = SecureRandom.hex(12)
  self.save
end
end
