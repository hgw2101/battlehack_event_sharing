class RidesController < ApplicationController
  def index
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    if current_user
      @ride = Ride.new
      @friends = current_user.friends
    else
      redirect_to root_path
    end
  end

  def create

    @ride = Ride.new
    @ride.name = params[:ride][:name]
    @ride.start_time = params[:ride][:start_time]
    @ride.end_time = params[:ride][:end_time]
    @ride.driver = current_user
    @ride.total_cost = params[:ride][:total_cost]

    if @ride.save
      @ride.riders << current_user
      @location_record = LocationRecord.create(
        location: params[:start_location],
        description: 'Start',
        locatable: @ride
         )
      @location_record = LocationRecord.create(
        location: params[:end_location],
        description: 'End',
        locatable: @ride
         )
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

end
