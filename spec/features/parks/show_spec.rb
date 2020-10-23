require 'rails_helper'

# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that park
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
     
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10

describe 'As a visitor' do
  describe "When I visit an amusement park’s show page" do
    before(:each) do
      @park1 = Park.create({name: "Funpark", price: 10})
      @ride1 = @park1.rides.create({name: "Coasterride", rating: 2})
      @ride2 = @park1.rides.create({name: "Logride", rating: 7})
    end
    
    it "I see the name and price of admissions for that amusement park" do
      visit "/parks/#{@park1.id}"

      expect(page).to have_content("#{@park1.name}")
      expect(page).to have_content("Admissions: $#{@park1.price}")
    end
    # it "And I see the names of all the rides that are at that park" do
    #   visit "/parks/#{@park1.id}"
    #   expect(page).to have_content("Rides:")
    #   @park1.rides.each do |ride|
    #     within("#ride-#{ride.id}") do
    #       expect(page).to have_content(ride.name)
    #     end
    #   end
    # end
    # it "I see the average thrill rating of this amusement park’s rides" do
    #   visit "/parks/#{@park1.id}"
    #   expect(page).to have_content("Average Thrill Rating of Rides: #{@park1.rides.avg_rating.round(2)}")
    #   end
    # end
  end
end
