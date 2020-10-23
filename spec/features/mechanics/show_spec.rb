require 'rails_helper'

# Story 3
# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of a ride that exists in the database
# And I click submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
# Add a ride to workload:
# _pretend_this_is_a_textfield_
#                       Submit

describe 'As a user' do
  describe "When I go to a mechanics show page" do
    before(:each) do
      @park1 = Park.create({name: "Funpark", price: 10})
      @ride1 = @park1.rides.create({name: "Coasterride", rating: 2})
      @ride2 = @park1.rides.create({name: "Logride", rating: 7})
      @mechanic1 = Mechanic.create({name: "Earl", years: 3})
      @mech1_ride1 = MechanicRide.create({mechanic_id: @mechanic1.id, ride_id: @ride1.id})
      @mech1_ride2 = MechanicRide.create({mechanic_id: @mechanic1.id, ride_id: @ride2.id})
    end
    it "I see their name, years of experience, and names of all rides they’re working on" do
      visit "/mechanics/#{@mechanic1.id}"
      expect(page).to have_content("Mechanic: #{@mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic1.years}")
      @mechanic.rides.each do |ride|
        within("#ride-#{ride.id}") do
          expect(page).to have_content(ride.name)
        end
      end
    end
  end
end
