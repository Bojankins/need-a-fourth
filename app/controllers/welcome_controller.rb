class WelcomeController < ApplicationController


  def index
    @user = current_user
    @teetime = Teetime.where(user_id: params[:user_id])
  end

end
