class LocationRecord < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true
end
