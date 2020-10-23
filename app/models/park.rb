class Park < ApplicationRecord
  has_many :rides

def avg_ride_rating
  rides.average(:rating)
end

end
