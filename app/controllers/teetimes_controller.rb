class TeetimesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :load_user
  
  def index
    @teetime = Teetime.where(user_id: current_user)
    @profile = Profile.where(user_id: current_user)
  end

  def all
    @teetime = Teetime.all
    @user = current_user
  end

  def new
    @teetime = Teetime.new
    @profile = Profile.new
  end

  def user_data
    @teetime = Teetime.where(user_id: params[:user_id])
    @profile = Profile.where(user_id: params[:user_id])
  end

  def create
    @teetime = Teetime.new(teetime_params)
    # @profile = Profile.create!(user_id: current_user.id)

    if @teetime.save
      # UserMailer.registration_confirmation.deliver
      redirect_to teetimes_path(@profile)
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
    @user = User.find_by_id(@teetime.user_id)
    @player = current_user
    if @teetime.update(teetime_params)
      UserMailer.player_confirmation(@user, @player).deliver
      redirect_to teetimes_all_path
    else
      render :edit
    end
  end

  # def show
  #   redirect_to teetimes_all_path
  # end

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
