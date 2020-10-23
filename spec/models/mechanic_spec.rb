require 'rails_helper'

describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'instance methods' do
    it "can list rides in alphabetical order" do
      @park1 = Park.create({name: "Funpark", price: 10})
      @ride1 = @park1.rides.create({name: "Teacupride", rating: 10})
      @ride2 = @park1.rides.create({name: "Coasterride", rating: 2})
      @ride3 = @park1.rides.create({name: "Logride", rating: 7})
      @mechanic1 = Mechanic.create({name: "Earl", years: 3})
      @mech1_ride1 = MechanicRide.create({mechanic_id: @mechanic1.id, ride_id: @ride1.id})
      @mech1_ride2 = MechanicRide.create({mechanic_id: @mechanic1.id, ride_id: @ride2.id})
      @mech1_ride3 = MechanicRide.create({mechanic_id: @mechanic1.id, ride_id: @ride3.id})

      expect(@mechanic1.alpha_rides).to eq([@ride2, @ride3, @ride1])
    end
  end
end
