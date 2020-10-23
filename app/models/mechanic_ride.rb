class MechanicRide < ApplicationRecord
  #relationships
  belongs_to :ride
  belongs_to :mechanic
end
