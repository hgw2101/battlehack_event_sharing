class User < ActiveRecord::Base
  has_many :provided_rides, class_name: "Ride", foreign_key: "user_id"

  has_many :user_rides
  has_many :booked_rides, through: :user_rides, source: :ride

  has_many :location_records, as: :locatable

  has_many :friendships
  has_many :friends, :through => :friendships, :source => :friend

  has_secure_password
end
