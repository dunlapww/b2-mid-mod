class Ride < ApplicationRecord
#relationships
  belongs_to :park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
end
