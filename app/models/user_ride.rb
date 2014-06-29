class UserRide < ActiveRecord::Base
  belongs_to :rider, class_name: "User", foreign_key: "user_id"
  belongs_to :ride

  validates :user_id, presence: true, uniqueness: {scope: :ride_id}
end
