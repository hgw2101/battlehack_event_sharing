class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @available_rides = []
    rides = Ride.all
    rides.each do |ride|
      if @user.friends.include?(ride.driver) && ride.start_time > Time.now
        @available_rides << ride
      end
    end
    @unaccepted_rides = UserRide.where(user_id: @user.id, rider_approval: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  # def accept

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :has_car?
  end
end
