class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: "User", foreign_key: "user_id"
  has_many :user_rides
  has_many :riders, through: :user_rides, source: :rider
  has_many :location_records, as: :locatable
end
