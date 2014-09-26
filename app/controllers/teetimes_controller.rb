class TeetimesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :load_user

  respond_to :html, :json
  
  def index
    @teetime = Teetime.where(user_id: current_user)
    @profile = Profile.where(user_id: current_user)
  end

  def all
    @teetime = Teetime.all.order(date: :asc)
    @user = current_user
  end

  def new
    @teetime = Teetime.new
    @profile = Profile.new
  end

  def user_data
    @teetime = Teetime.where(user_id: params[:user_id])
    @profile = Profile.where(user_id: params[:user_id])
    @user = User.where(id: params[:user_id])
  end

  def create
    @teetime = Teetime.new(teetime_params)
    # @profile = Profile.create!(user_id: current_user.id)

    if @teetime.save
      # UserMailer.registration_confirmation.deliver
      redirect_to teetimes_all_path(@profile)
    else
      flash.now[:alert] = "Teetime could not be created."
      render :new
    end
  end

  def edit
    @teetime = Teetime.find(params[:id])
    @user = User.find_by_id(@teetime.user_id)
  end

  def update
   @teetime = Teetime.find(params[:id])
   @teetime.update_attributes(teetime_params)
   respond_with @teetime
    @player = current_user
    if @teetime.update(teetime_params)
      UserMailer.player_confirmation(@user, @player).deliver
    else
      render :edit
    end
  end

  def destroy
    teetime = Teetime.find(params[:id])
    teetime.destroy!
    flash.notice = "Your teetime has been deleted."
    redirect_to '/teetimes/all'
  end


  protected

  def teetime_params
    params.require(:teetime).permit(:course, :date, :player1, :player2, :player3, :player4,  :user_id)
  end

  def profile_params
    params.require(:profile).permit(:description, :profile_image, :gear, :user_id)
  end

  def load_user
    @user = current_user
  end

end
