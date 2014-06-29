class UserRidesController < ApplicationController
  def rider_approve
    @user_ride = UserRide.find(params[:id])
    @user_ride.rider_approval = true
    @user_ride.save
    respond_to do |format|
      format.json { render json: @user_ride}
    end
  end

  def driver_approve
    @user_ride = UserRide.find(params[:id])
    @user_ride.driver_approval = true
    @user_ride.save
    respond_to do |format|
      format.json { render json: @user_ride}
    end
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @ride.riders << current_user
    redirect_to ride_path(@ride.id)

  end
end
