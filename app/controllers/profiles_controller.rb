class ProfilesController < ApplicationController

  before_action :authenticate_user!
  
  before_action :load_user

  respond_to :html, :json

  def update
    @profile = Profile.find_by_id(current_user)
    if @profile.update(profile_params)
      redirect_to usersteetime_path(current_user), notice: "Your profile has been updated."
    else
      flash.now[:alert] = "Your changes could not be saved."
      redirect_to '/teetimes/user/:user_id'
    end
  end

  def edit
    @profile = Profile.find_by_id(current_user)
  end

  protected

  def load_user
    @user == current_user
  end

  def profile_params
    params.require(:profile).permit(:description, :avatar, :gear, :user_id)
  end

end