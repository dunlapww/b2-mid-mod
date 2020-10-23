class MechanicRidesController < ApplicationController
  def create
    MechanicRide.create({mechanic_id: params[:mech_id],ride_id: params[:ride_id]})
    redirect_to "/mechanics/#{params[:mech_id]}"
  end
end
