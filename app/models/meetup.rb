class Meetup < ApplicationRecord
  has_many :users, through: :meetup_users
  has_many :meetup_users
end
