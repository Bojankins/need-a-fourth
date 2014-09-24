class ProfilesController < ApplicationController

  before_action :authenticate_user!
  
  before_action :load_user

  respond_to :html, :json

  def update
    @Profile = Profile.where(user_id: current_user)

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.json { respond_with_bip(@profile) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@profile) }
      end
    end
  end

  protected

  def load_user
    @user == current_user
  end

  
end