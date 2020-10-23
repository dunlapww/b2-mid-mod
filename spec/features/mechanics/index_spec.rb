require 'rails_helper'

# Story 1
# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# Ex:
#              All Mechanics
#    Sam Mills - 10 years of experience
#    Kara Smith - 11 years of experience

describe 'As a user' do
  describe 'When I vist a mechanics index page' do
    before(:each) do
      @mechanic1 = Mechanic.create({name: "Earl", years: 3})
      @mechanic2 = Mechanic.create({name: "Steve", years: 6})
    end
    it "I see a header saying all 'All Mechanics' and a list of their names and years of experience" do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      [@mechanic1, @mechanic2].each do |mechanic|
        within("#mechanic-#{mechanic.id}") do
          expect(page).to have_content("#{mechanic.name} - #{mechanic.years} years of experience")
        end
      end
    end
  end
end
