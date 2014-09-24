class ProfileController < ApplicationController

  before_action :authenticate_user!
  
  before_action :load_user

  respond_to :html, :json

  def update
    @profile = Profile.find(params[:user_id])
    @Profile.update_attributes(params[:profile])
    respond_with @profile
  end



  protected

  def load_user
    @user == current_user
  end

  
end