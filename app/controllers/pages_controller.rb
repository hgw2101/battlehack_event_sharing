class PagesController < ApplicationController
  def index
    unless current_user
      @user = User.new
    else
      redirect_to user_path(current_user)
    end
  end
end
