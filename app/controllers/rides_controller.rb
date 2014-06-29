class RidesController < ApplicationController
  def index
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = User.new
    @ride.name = params[:ride][:name]
    @ride.start_time = params[:ride][:start_time]
    @ride.end_time = params[:ride][:end_time]
    @ride.driver = current_user

    if @ride.save
      @location_record = LocationRecord.create(
        location: params[:start_location],
        type: 'Start',
        locatable: @ride
         )
      @location_record = LocationRecord.create(
        location: params[:end_location],
        type: 'End',
        locatable: @ride
         )
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

end
