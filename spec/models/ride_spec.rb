require 'rails_helper'

describe Ride, type: :model do
  describe 'relationships' do
    it {should belong_to :park}
  end
end
