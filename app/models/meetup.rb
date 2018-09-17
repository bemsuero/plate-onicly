class Meetup < ApplicationRecord
  has_many :meetup_users
  has_many :users, through: :meetup_users
end
