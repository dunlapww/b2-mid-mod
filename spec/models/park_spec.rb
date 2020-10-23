require 'rails_helper'

describe Park, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end
  describe 'instance methods' do
    it 'can calculate average ride rating' do
      @park1 = Park.create({name: "Funpark", price: 10})
      @ride1 = @park1.rides.create({name: "Coasterride", rating: 2})
      @ride2 = @park1.rides.create({name: "Logride", rating: 7})

      expect(@park1.avg_ride_rating).to eq(4.5)
    end
  end
end
