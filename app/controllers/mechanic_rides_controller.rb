class MechanicRidesController < ApplicationController
  def create
    MechanicRide.create(mechride_params)
    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end

  private
  def mechride_params
    params.permit(:mechanic_id, :ride_id)
  end
end
