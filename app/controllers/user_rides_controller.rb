class UserRidesController < ApplicationController
  def rider_approve
    @user_ride = UserRide.find(params[:id])
    @user_ride.rider_approval = true
    @user_ride.save
    respond_to do |format|
      puts '999999999999999999999999999999'
      puts 'fuuuuuck'
      puts '999999999999999999999999999999'
      format.json { render json: @user_ride}
    end
  end
end
