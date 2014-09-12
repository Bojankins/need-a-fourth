
class TeetimesController < ApplicationController
  # before_action :authenticate_user!
  
  before_action :load_user
  
  def index
    @teetime = Teetime.where(user_id: current_user)
  end

  def new
    @teetime = Teetime.new
  end

  def all
    @teetime = Teetime.all
    @user = User.all
  end

  def user_data
    @teetime = Teetime.where(user_id: params[:user_id])
  end

  def create
    @teetime = Teetime.new(teetime_params)
    if @teetime.save
      # UserMailer.registration_confirmation.deliver
      redirect_to teetimes_path(@user)
    else
      flash.now[:alert] = "Teetime could not be created."
      render :new
    end
  end

  protected

  def teetime_params
    params.require(:teetime).permit(:course, :date, :player1, :user_id)
  end

  def load_user
    @user = current_user
  end

end
