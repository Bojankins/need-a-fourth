
require 'pry'
class TeetimesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :load_user
  
  def index
    @teetime = Teetime.where(user_id: current_user)
  end

  def new
    @teetime = Teetime.new
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
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
      redirect_to teetimes_path(current_user)
    else
      flash.now[:alert] = "Teetime could not be created."
      render :new
    end
  end

  def edit
    @teetime = Teetime.find(params[:id])
  end

  def update
    @teetime = Teetime.find(params[:id])

    if @teetime.update(teetime_params)
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

  def load_user
    @user = current_user
  end

end
