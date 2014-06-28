class UserRide < ActiveRecord::Base
  belongs_to :rider, class_name: "User", foreign_key: "user_id"
  belongs_to :ride
end
