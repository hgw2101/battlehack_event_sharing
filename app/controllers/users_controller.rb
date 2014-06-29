class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @available_rides = Ride.where(["start_time > ?", Time.now])
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

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :has_car?
  end
end
