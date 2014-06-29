class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: "User", foreign_key: "user_id"
  has_many :user_rides
  has_many :riders, through: :user_rides, source: :rider
  has_many :location_records, as: :locatable

  def price_per_rider
    riders = UserRide.where(ride_id: self.id, rider_approval: true, driver_approval: true).count
    if riders == 0
      price = 0
    else
      price = (self.total_cost / riders).round(2)
    end
    price
  end
end
